//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LineChecker)

-(BOOL) areAllObjectsAreIdentical;

@end

@implementation NSArray (LineChecker)

-(BOOL) areAllObjectsAreIdentical{ //category method for NSArray
    NSSet *set = [NSSet setWithArray:self];
    return ([set count] <= 1);
}
@end

@interface Game:NSObject

-(BOOL)checkWin;
-(BOOL)getWin;

-(BOOL)checkDraw;

-(void)startGame;

-(void)printBoard;
-(void)printTutorialBoard;

-(void)turn;

-(void)setGameSize:(int)size;
-(int)getGameSize;

//Easy, Medium, Hard
-(void)setDifficulty:(int)level;
-(int)getDifficulty;

//Player vs. Player OR Player vs. Computer
-(void)setMode:(int)mode;
-(int)getMode;

@end

@implementation Game{
    int _mode;
    
    int _difficulty;
    
    int _playerTurn;
    int _turnCount;
    
    BOOL _win;
    NSString *_winner;
    
    NSMutableArray *_gameboard;
    int _gameSize;
    int _maxIndex;
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

-(void)printTutorialBoard{
    for (int i = 0; i < pow (_gameSize,2); i++) {
        
        // create a string from i
        NSString *placeNumber = [NSString stringWithFormat:@"%d",i];
        int lengthOfPlaceNumber = (int)[placeNumber length];
        
        // check the length of the sting
        if (lengthOfPlaceNumber == 1) {
            NSString *zero = [NSString stringWithFormat:@"0"];
            placeNumber = [zero stringByAppendingString:placeNumber];
        }
        //convert NSString to char string
        const char *placeNumberCharString = [placeNumber cStringUsingEncoding: NSUTF8StringEncoding];
        
        if ((i >= _gameSize) && (i % _gameSize  == 0)) {
            printf("\n|%s|", placeNumberCharString);
            
        }
        else{
            printf("|%s|", placeNumberCharString);
        }
    }
    printf("\n");
}

-(void) printBoard {
    for (int i = 0; i < pow (_gameSize,2); i++) {
        
        NSString *placeHolderString = [_gameboard objectAtIndex:i];
        const char *placeHolderCharString = [placeHolderString cStringUsingEncoding:NSUTF8StringEncoding];
        
        if ((i >= _gameSize) && (i % _gameSize  == 0)) {
            printf("\n|%s|", placeHolderCharString);
        }
        else{
            printf("|%s|", placeHolderCharString);
        }
    }
    printf("\n");
}

-(void)startGame {
    //greeting
    NSLog(@"Welcome to Derek's and Eric's TicTacToe!");
    _win = NO;
    
    //set game mode
    BOOL modeSet = NO;
    while (modeSet == NO) {
        NSLog(@"Select Game Mode:");
        NSLog(@"    1) Player vs. Player");
        NSLog(@"    2) Player vs. Computer");
        int userGameMode;
        scanf("%d",&userGameMode);
        fpurge(stdin);
        
        if (userGameMode == 1) {
            [self setMode:1];
            modeSet = YES;
        }
        else if (userGameMode == 2){
            [self setMode:2];
            modeSet = YES;
        }
        else {
            NSLog(@"Invalid game mode.");
        }
    }
    
    //set game size
    if (_mode == 1) {
        BOOL gameSizeSet = NO;
        while (gameSizeSet == NO) {
            NSLog(@"Set a game size from 3-10, fool!:");
            int userGameSize;
            scanf("%d",&userGameSize);
            fpurge(stdin);
            
            
            if (userGameSize >=3 && userGameSize <= 10) {
                [self setGameSize:userGameSize];
                gameSizeSet = YES;
            }
            else{
                NSLog(@"Invalid size.");
            }
        }
    }
    else{
        [self setGameSize:3]; //Computer only works with game size of 3
    }

    
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
    
    //print tutorial board
    [self printTutorialBoard];
    
    //Game Loop
    _playerTurn = 1;
    _turnCount = 1;
    while (_win == NO) {
        
        [self turn];
        
        [self printBoard];
        
        if ([self checkWin] == TRUE) {
            _win = TRUE;
            
            if (_turnCount % 2 == 0) {
                
                if (_mode == 1) {
                    _winner = @"Player X";
                }
                else{
                    _winner = @"Player";
                }
            }
            else{
                
                if (_mode == 1) {
                    _winner = @"Player O";
                }
                else{
                    _winner = @"Computer";
                }
                
            }
            NSLog(@"%@ WINS!",_winner);
        }
        
        if ([self checkDraw] == TRUE) {
            _win = TRUE; //set win to true to break game loop
            NSLog(@"It's a draw.");
        }
    }
}

-(void)turn{
    
    if (_turnCount % 2 == 1) {
        while (_playerTurn == 1) {
            NSLog(@"Player 1, make your move: ");
            int currentMove;
            scanf("%d",&currentMove);
            fpurge(stdin);
            
            NSString *stringOfCurrentMove = [NSString stringWithFormat:@"%d",currentMove];
            int lengthOfStringOfCurrentMove = (int)[stringOfCurrentMove length];
            if (lengthOfStringOfCurrentMove == 1) {
                NSString *zero = [NSString stringWithFormat:@"0"];
                stringOfCurrentMove = [zero stringByAppendingString:stringOfCurrentMove];
            }
            
            //NOTE that the order of the conditionals matters. WHY?????
            if ((currentMove<=_maxIndex) && (currentMove>=0) && ([_gameboard[currentMove] isEqual: stringOfCurrentMove])) {
                [_gameboard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"~X"];
                _playerTurn = 2;
            }
            else {
                NSLog(@"Invalid move. Enter a number from 0-%d.",_maxIndex);
            }
            
        }
    }
    else{
        while (_playerTurn == 2) {
            
            int currentMove;
            if (_mode == 1) {
                NSLog(@"Player 2, make your move: ");
                scanf("%d",&currentMove);
                fpurge(stdin);
                
                NSString *stringOfCurrentMove = [NSString stringWithFormat:@"%d",currentMove];
                int lengthOfStringOfCurrentMove = (int)[stringOfCurrentMove length];
                if (lengthOfStringOfCurrentMove == 1) {
                    NSString *zero = [NSString stringWithFormat:@"0"];
                    stringOfCurrentMove = [zero stringByAppendingString:stringOfCurrentMove];
                }
                
                if ((currentMove<=_maxIndex) && (currentMove>=0) && ([_gameboard[currentMove] isEqual: stringOfCurrentMove])) {
                    [_gameboard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"~O"];
                    _playerTurn = 1;
                }
                else {
                    NSLog(@"Invalid move. Enter a number from 0-%d.",_maxIndex);
                }
            }
            else{
                int computerMove = arc4random_uniform(_maxIndex + 1);
                if ((![[_gameboard objectAtIndex:computerMove]  isEqual: @"~X"]) && (![[_gameboard objectAtIndex:computerMove]  isEqual: @"~O"])) {
                    NSLog(@"Computer is making a move...");
                    sleep(1.5);
                    [_gameboard replaceObjectAtIndex:(NSUInteger)computerMove withObject:@"~O"];
                    _playerTurn = 1;
                }

            }
            
        }
    }
    _turnCount = _turnCount + 1;
}

//-(BOOL)checkWin{
//    
//    NSString *playerPiece;
//    
//    for (int i = 0; i < 2; i++) {
//        
//        //sets player piece for each of the two loops
//        if (i == 1) {
//            playerPiece = @"~X";
//            _winner = @"Player 1";
//        }
//        else{
//            playerPiece = @"~O";
//            _winner = @"Player 2";
//        }
//        
//        // |X|X|X|
//        // | | | |
//        // | | | |
//        if (([_gameboard[0] isEqual:playerPiece]) && ([_gameboard[1] isEqual:playerPiece]) && ([_gameboard[2] isEqual:playerPiece])){
//            return YES;
//        }
//        // | | | |
//        // |X|X|X|
//        // | | | |
//        if (([_gameboard[3] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[5] isEqual:playerPiece])){
//            return YES;
//        }
//        // | | | |
//        // | | | |
//        // |X|X|X|
//        if (([_gameboard[6] isEqual:playerPiece]) && ([_gameboard[7] isEqual:playerPiece]) && ([_gameboard[8] isEqual:playerPiece])){
//            return YES;
//        }
//        // |X| | |
//        // |X| | |
//        // |X| | |
//        if (([_gameboard[0] isEqual:playerPiece]) && ([_gameboard[3] isEqual:playerPiece]) && ([_gameboard[6] isEqual:playerPiece])){
//            return YES;
//        }
//        // | |X| |
//        // | |X| |
//        // | |X| |
//        if (([_gameboard[1] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[7] isEqual:playerPiece])){
//            return YES;
//        }
//        // | | |X|
//        // | | |X|
//        // | | |X|
//        if (([_gameboard[2] isEqual:playerPiece]) && ([_gameboard[5] isEqual:playerPiece]) && ([_gameboard[8] isEqual:playerPiece])){
//            return YES;
//        }
//        // |X| | |
//        // | |X| |
//        // | | |X|
//        if (([_gameboard[0] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[8] isEqual:playerPiece])){
//            return YES;
//        }
//        // | | |X|
//        // | |X| |
//        // |X| | |
//        if (([_gameboard[2] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[6] isEqual:playerPiece])){
//            return YES;
//        }
//        
//    }
//    return NO;
//}

-(BOOL)checkWin{
    
    BOOL gameWon = NO;
    
    NSMutableArray *line = [[NSMutableArray alloc] init]; //array of the line we are checking for a win
    
    //HORIZONAL WIN TEST
    for (int i = 0; i < pow(_gameSize, 2); i++) {
        
        [line addObject:[_gameboard objectAtIndex:i]];
        
        if ([line count] == _gameSize) { //check if all objects in line are identical when line array reaches the gameSize
            gameWon = [line areAllObjectsAreIdentical];
            
            if (gameWon == YES) {
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
            gameWon = [line areAllObjectsAreIdentical];
            
            if (gameWon == YES) {
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
        gameWon = [line areAllObjectsAreIdentical];
        
        if (gameWon == YES) {
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
        gameWon = [line areAllObjectsAreIdentical];
        
        if (gameWon == YES) {
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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Game *ticTacToe =[[Game alloc]init];
        [ticTacToe startGame];
        
        // while ([ticTacToe win] == NO) {
        // ask user input
        // validate the users move
        // if user move valid
        //  make move
        // validate board
        // if won
        //
        // // ask game to priint board
    }
    
    return 0;
}

