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

//-(void)movePadder:(NSString *)stringOfCurrentMove {
//    int lengthOfStringOfCurrentMove = (int)[stringOfCurrentMove length];
//    if (lengthOfStringOfCurrentMove == 1) {
//        stringOfCurrentMove = [NSString stringWithFormat:@"%02d", stringOfCurrentMove];
//    }
//}

-(NSMutableString *)makeMove{
    NSLog(@"Player %d make your move:",_playerTurn);
    scanf("%d",&_currentMove);
    fpurge(stdin);
    
    NSMutableString *stringOfCurrentMove = [NSMutableString stringWithFormat:@"%02d",_currentMove];
//    [self movePadder:stringOfCurrentMove];
    
    return stringOfCurrentMove;
}

-(NSMutableString *)computerMakeMove{
    //Easy Mode computer move
    if (_difficulty == 1) {
        _currentMove = arc4random_uniform(_maxIndex + 1);
        NSMutableString *stringOfCurrentMove = [NSMutableString stringWithFormat:@"%02d",_currentMove];
//        [self movePadder:stringOfCurrentMove];
        return stringOfCurrentMove;
    }
    return @"HEHEE";
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
        
        if (_mode == 1) {
            stringOfCurrentMove = [self makeMove];
        }
        else if (_mode == 2){
            stringOfCurrentMove = [self computerMakeMove];
        }
        
        if (([_gameboard[_currentMove] isEqual: stringOfCurrentMove]) && (_currentMove<=_maxIndex) && (_currentMove>=0)) {
            [_gameboard replaceObjectAtIndex:(NSUInteger)_currentMove withObject:[self getPlayerPiece]];
            moveMade = YES;
        }
        else {
            NSLog(@"Invalid move. Enter a number from 0-%d.",_maxIndex);
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

-(BOOL)checkWin{
    
    NSMutableArray *line = [[NSMutableArray alloc] init]; //array of the line we are checking for a win
    
    //HORIZONAL WIN TEST
    for (int i = 0; i < pow(_gameSize, 2); i++) {
        
        [line addObject:[_gameboard objectAtIndex:i]];
        
        if ([line count] == _gameSize) { //check if all objects in line are identical when line array reaches the gameSize
            _win = [line areAllObjectsAreIdentical];
            
            if (_win == YES) {
                return YES;
            }
            else{
                [line removeAllObjects]; //empty the line array
            }
        }
    }
    
    int currentIndex;
    int lastIndex;
    
    //VERTICAL WIN TEST
    for (int i = 0; i < _gameSize; i++) {
        currentIndex = i;
        lastIndex = 0;
        
        for (int i = 0; i < _gameSize; i++) {
            [line addObject:[_gameboard objectAtIndex:currentIndex]];
            lastIndex = currentIndex;
            currentIndex = lastIndex + _gameSize;
        }
        
        if ([line count] == _gameSize) { //check if all objects in line are identical when line array reaches the gameSize
            _win = [line areAllObjectsAreIdentical];
            
            if (_win == YES) {
                return YES;
            }
            else{
                [line removeAllObjects]; //empty the line array
            }
        }
    }
    
    //DIAGONAL WIN TEST
    
    // |X| | |
    // | |X| |
    // | | |X|
    currentIndex = 0;
    lastIndex = 0;
    for (int i = 0; i < _gameSize; i++) {
        [line addObject:[_gameboard objectAtIndex:currentIndex]];
        lastIndex = currentIndex;
        currentIndex = lastIndex + _gameSize + 1;
    }
    
    if ([line count] == _gameSize) { //check if all objects in line are identical when line array reaches the gameSize
        _win = [line areAllObjectsAreIdentical];
        
        if (_win == YES) {
            return YES;
        }
        else{
            [line removeAllObjects]; //empty the line array
        }
    }
    
    // | | |X|
    // | |X| |
    // |X| | |
    currentIndex = _gameSize - 1;
    lastIndex = _gameSize - 1;
    for (int i = 0; i < _gameSize; i++) {
        [line addObject:[_gameboard objectAtIndex:currentIndex]];
        lastIndex = currentIndex;
        currentIndex = lastIndex + _gameSize - 1;
    }
    
    if ([line count] == _gameSize) { //check if all objects in line are identical when line array reaches the gameSize
        _win = [line areAllObjectsAreIdentical];
        
        if (_win == YES) {
            return YES;
        }
        else{
            [line removeAllObjects]; //empty the line array
        }
    }
    return NO;
}

-(BOOL)checkDraw{
    if ((_win == NO) && (_turnCount == (_maxIndex + 2))){
        return TRUE;
    }
    return FALSE;
}

@end
