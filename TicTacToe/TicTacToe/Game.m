//
//  Game.m
//  TicTacToe
//
//  Created by Z on 7/7/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "Game.h"
#import "Player.h"
#import "NSArray+LineChecker.h"
#import "NSString+isNumeric.h"
#import "TicTacToeRowGenerator.h"

NSString * const PossibleWinnerString = @"PossibleWinnerString";

@implementation Game {
    int _mode;
    
    int _difficulty;
    
    int _playerTurn;
    int _turnCount;
    
    BOOL _win;
    NSString *_winner;
    
    NSMutableArray *_gameboard;
    int _gameSize;
    int _maxIndex;
    
    int _currentMove;
}

- (NSMutableArray *)getGameBoard {
    return _gameboard;
}

-(void)setDifficulty:(int)level{
    _difficulty = level;
}

-(int)getDifficulty{
    return _difficulty;
}

-(void)setGameSize:(int)size{
    _gameSize = size;
}

-(int)getGameSize{
    return _gameSize;
}

-(void)setMode:(int)mode{
    _mode = mode;
}
-(int)getMode{
    return _mode;
}

-(BOOL)getWin{
    return _win;
}

-(int)getTurnCount{
    return _turnCount;
}

-(void)setupGame {
    
    //greeting
    NSLog(@"Welcome to Derek's and Eric's TicTacToe!");
    _win = NO;
    _playerTurn = 1;
    
    //calculate max index
    _maxIndex = (pow(_gameSize, 2) - 1);
    
    //fill gameboard with the indices of the positions to occupy
    _gameboard = [[NSMutableArray alloc] init];
    for (int i = 0; i < pow (_gameSize,2); i++) {
        
        // create a string from i
        NSString *placeNumber = [NSString stringWithFormat:@"%d",i];
        int lengthOfPlaceNumber = (int)[placeNumber length];
        
        // if the string is of a single digit number, padd with 0 for formatting purposes
        if (lengthOfPlaceNumber == 1) {
            NSString *zero = [NSString stringWithFormat:@"0"];
            placeNumber = [zero stringByAppendingString:placeNumber];
        }
        [_gameboard addObject: placeNumber];
    }
}

-(NSString *)getPlayerPiece{
    NSString *playerPiece;
    if (_playerTurn == 2) {
        playerPiece = @"~O";
    }
    else{
        playerPiece = @"~X";
    }
    return playerPiece;
}

-(void)turn{
    BOOL moveMade = NO;
    while (moveMade == NO) {
        
        NSString *stringOfCurrentMove;
        
        if (_mode == 1) { //Player vs. Player
            stringOfCurrentMove = [self makeMove];
        }
        else if (_mode == 2){ //Player vs. Computer
            if (_playerTurn == 1) {
                stringOfCurrentMove = [self makeMove];
            }
            else{
                stringOfCurrentMove = [self computerMakeMove];
            }
        }
        
        if (([_gameboard[_currentMove] isEqual: stringOfCurrentMove]) && (_currentMove<=_maxIndex) && (_currentMove>=0)) {
            [_gameboard replaceObjectAtIndex:(NSUInteger)_currentMove withObject:[self getPlayerPiece]];
            moveMade = YES;
            
            if ((_mode != 1) && (_playerTurn == 2)) {
                NSLog(@"Computer is thinking...");
                usleep(1e6);
                NSLog(@"Computer has made a move!");
            }
            
        }
        else {
            if (_mode == 1) {
                NSLog(@"Invalid move. Enter a number from 0-%d.",_maxIndex);
            }
        }
    }
    _turnCount = _turnCount + 1;
    
    if (_turnCount % 2 != 0) {
        _playerTurn = 2;
    }
    else{
        _playerTurn = 1;
    }
}

-(NSString *)makeMove{
    NSLog(@"Player %d make your move:",_playerTurn);
    scanf("%d",&_currentMove);
    fpurge(stdin);
    
    NSString *stringOfCurrentMove = [NSString stringWithFormat:@"%02d",_currentMove];
    
    return stringOfCurrentMove;
}

-(NSString *)computerMakeMove{
    
    //Easy Mode computer move
    if (_difficulty == Easy) {
        _currentMove = arc4random_uniform(_maxIndex + 1);
        NSString *stringOfCurrentMove = [NSString stringWithFormat:@"%02d",_currentMove];
        return stringOfCurrentMove;
    }
    
    //Medium Mode computer move
    else if (_difficulty == Medium){
        
        NSString *stringOfCurrentMove = [NSString stringWithString:[self makeWinMove]];
        
        if ([stringOfCurrentMove isEqualToString:@"none"]) { //if no win move to make
            
            stringOfCurrentMove = [self makeBlockMove];
            
            if ([stringOfCurrentMove isEqualToString:@"none"]) { //if no block move to make
                
                _currentMove = arc4random_uniform(_maxIndex + 1);
                stringOfCurrentMove = [NSString stringWithFormat:@"%02d",_currentMove]; //random move
            }
        }
        
        _currentMove = [stringOfCurrentMove intValue];
        return stringOfCurrentMove;
    }
    
    return @"HEHEE";
}

-(NSString *)makeBlockMove{
    
    NSDictionary *possibleWinnerAndWinningMove = [self whoCanWinOnNextMove];
    
    if ([[possibleWinnerAndWinningMove objectForKey:@"PossibleWinner"] isEqualToString:@"PlayerX"] ) {
        return [possibleWinnerAndWinningMove objectForKey:@"WinningMove"];
    }
    return @"none";
}

-(NSString *)makeWinMove{
    
    NSDictionary *possibleWinnerAndWinningMove = [self whoCanWinOnNextMove];
    
    if ([[possibleWinnerAndWinningMove objectForKey:@"PossibleWinner"] isEqualToString:@"PlayerO"] ) {
        return [possibleWinnerAndWinningMove objectForKey:@"WinningMove"];
    }
    return @"none";
}

-(NSDictionary *) whoCanWinOnNextMove {
    
    NSArray *allLines = [self makeAllLines];
    
    for (int i = 0; i< allLines.count; i++) {
        
        for (int j = 0; j < [[allLines objectAtIndex:i] count]; j++){
            
            NSDictionary *countsForElementsInLine = [self lineInspect:[[allLines objectAtIndex:i] objectAtIndex:j]];
            
            if (([[countsForElementsInLine valueForKey:@"xPieceCount"] intValue] == _gameSize - 1) && ([[countsForElementsInLine valueForKey: @"IndicesOfSpaces"] count] == 1)) {
                NSDictionary *possibleWinnerAndWinningMove = [NSDictionary dictionaryWithObjectsAndKeys:[[countsForElementsInLine valueForKey: @"IndicesOfSpaces"]objectAtIndex:0] , @"WinningMove", @"PlayerX", @"PossibleWinner", nil];
                return possibleWinnerAndWinningMove; //returns PlayerX and WinningMove
            }
            else if (([[countsForElementsInLine valueForKey:@"oPieceCount"] intValue] == _gameSize - 1) && ([[countsForElementsInLine valueForKey: @"IndicesOfSpaces"] count] == 1)) {
                NSDictionary *possibleWinnerAndWinningMove = [NSDictionary dictionaryWithObjectsAndKeys:[[countsForElementsInLine valueForKey: @"IndicesOfSpaces"] objectAtIndex:0] , @"WinningMove", @"PlayerO", @"PossibleWinner", nil]; //returns PlayerO and WinningMove
                return possibleWinnerAndWinningMove;
                
            }
        }
    }
    
    NSDictionary *noWinner = @{
                               @"WinningMove" : @"none",
                               @"PossibleWinner":@"none"
                               };
    
    return noWinner;
}

-(NSArray *)makeAllLines{
    NSArray *horizontals = [TicTacToeRowGenerator allLinesForDirection:Horizonal withGame:_gameboard];
    NSArray *verticals = [TicTacToeRowGenerator allLinesForDirection:Vertical withGame:_gameboard];
    NSArray *diagonals = [TicTacToeRowGenerator allLinesForDirection:Diagonal withGame:_gameboard];
    NSArray *allLines = [NSArray arrayWithObjects:horizontals,verticals,diagonals, nil];
    
    return allLines;
}

-(NSDictionary *)lineInspect:(NSMutableArray*)line{
    NSNumber *xPieceCount = [NSNumber numberWithInt:0];
    NSNumber *oPieceCount = [NSNumber numberWithInt:0];
    NSNumber *spaceCount = [NSNumber numberWithInt:0];
    NSMutableArray *IndicesOfSpaces = [[NSMutableArray alloc] init];
    
    for (int j = 0; j < [line count]; j++) {
        if ([[line objectAtIndex:j]  isEqual: @"~X"]) {
            xPieceCount = [NSNumber numberWithInt: [xPieceCount intValue] + 1 ];
        }
        else if ([[line objectAtIndex:j]  isEqual: @"~O"]) {
            oPieceCount = [NSNumber numberWithInt: [oPieceCount intValue] + 1 ];
        }
        else {
            [IndicesOfSpaces addObject:[line objectAtIndex:j]];
            spaceCount = [NSNumber numberWithInt: [spaceCount intValue] + 1 ];
        }
    }
    
    NSArray *keyArray = [NSArray arrayWithObjects: @"xPieceCount", @"oPieceCount", @"spaceCount", @"IndicesOfSpaces",nil];
    NSArray *valArray = [NSArray arrayWithObjects: xPieceCount, oPieceCount, spaceCount, IndicesOfSpaces, nil];
    
    NSDictionary *countsForElementsInLine = [NSDictionary dictionaryWithObjects:valArray forKeys:keyArray];
    return countsForElementsInLine;
}

-(BOOL)checkWin{
    
    NSArray *allLines = [self makeAllLines];
    
    for (int i = 0; i< allLines.count; i++) {
        
        for (int j = 0; j < [[allLines objectAtIndex:i] count]; j++){
            
            NSDictionary *countsForElementsInLine = [self lineInspect:[[allLines objectAtIndex:i] objectAtIndex:j]];
            
            if ([[countsForElementsInLine valueForKey:@"xPieceCount"] intValue] == _gameSize) {
                _win = TRUE;
                return TRUE;
            }
            else if ([[countsForElementsInLine valueForKey:@"oPieceCount"] intValue] == _gameSize) {
                _win = TRUE;
                return TRUE;
            }
        }
    }
    return FALSE;
}

-(BOOL)checkDraw{
    if ((_win == NO) && (_turnCount == (_maxIndex + 2))){
        return TRUE;
    }
    return FALSE;
}


@end
