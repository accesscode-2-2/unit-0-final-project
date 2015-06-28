//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game:NSObject

-(BOOL)checkWin;
-(void)startGame;

-(void)printBoard;
-(void)printTutorialBoard;

-(void)turn;

@end

@implementation Game{
    NSString *_mode;
    NSInteger *_difficulty;
    
    int _playerTurn;
    
    BOOL *_win;
    NSString *_winner;
    
    NSMutableArray *_gameboard;
}

-(void)printTutorialBoard{
    NSLog(@"|0|1|2|");
    NSLog(@"|3|4|5|");
    NSLog(@"|6|7|8|");
}


-(void) printBoard {
    NSLog(@"|%@|%@|%@|",[_gameboard objectAtIndex:0],[_gameboard objectAtIndex:1],[_gameboard objectAtIndex:2] );
    NSLog(@"|%@|%@|%@|",[_gameboard objectAtIndex:3],[_gameboard objectAtIndex:4],[_gameboard objectAtIndex:5] );
    NSLog(@"|%@|%@|%@|",[_gameboard objectAtIndex:6],[_gameboard objectAtIndex:7],[_gameboard objectAtIndex:8] );
    
}
-(void)startGame {
    NSLog(@"Welcome to Derek's and Eric's TicTacToe!");
    _win = NO;
    
    //fill gameboard with spaces
    _gameboard = [[NSMutableArray alloc] init];
    for (int i = 0; i < 9; i++) {
        [_gameboard addObject:@" "];
    }
    
    //print tutorial board
    [self printTutorialBoard];
    
    //Game Loop
    _playerTurn = 1;
    while (_win == NO) {
        [self turn];
    }
}

-(void)turn{
    while (_playerTurn == 1) {
        NSLog(@"Player 1, make your move: ");
        int currentMove;
        scanf("%d",&currentMove);
        
        if (([_gameboard[currentMove] isEqual: @" "]) && (currentMove>=0) && (currentMove<=8)) {
            [_gameboard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"X"];
            _playerTurn = 2;
        }
        else {
            NSLog(@"Invalid move. Enter a number from 0-8.");
        }
    }
    
    [self printBoard];
    
    while (_playerTurn == 2) {
        NSLog(@"Player 2, make your move: ");
        int currentMove;
        scanf("%d",&currentMove);
        fpurge(stdin);
        
        if (([_gameboard[currentMove] isEqual: @" "]) && (currentMove>=0) && (currentMove<=8)) {
            [_gameboard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"O"];
            _playerTurn = 1;
        }
        else {
            NSLog(@"Invalid move. Enter a number from 0-8.");
        }
        
    }
    [self printBoard];
}

-(BOOL)checkWin{
    
    NSString *playerPiece;
    
    for (int i = 0; i < 2; i++) {
        
        //sets player piece for each of the two loops
        if (i == 1) {
            playerPiece = @"X";
            _winner = @"Player 1";
        }
        else{
            playerPiece = @"O";
            _winner = @"Player 2";
        }
        
        // |X|X|X|
        // | | | |
        // | | | |
        if (([_gameboard[0] isEqual:playerPiece]) && ([_gameboard[1] isEqual:playerPiece]) && ([_gameboard[2] isEqual:playerPiece])){
            return YES;
        }
        // | | | |
        // |X|X|X|
        // | | | |
        if (([_gameboard[3] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[6] isEqual:playerPiece])){
            return YES;
        }
        // | | | |
        // | | | |
        // |X|X|X|
        if (([_gameboard[6] isEqual:playerPiece]) && ([_gameboard[7] isEqual:playerPiece]) && ([_gameboard[8] isEqual:playerPiece])){
            return YES;
        }
        // |X| | |
        // |X| | |
        // |X| | |
        if (([_gameboard[0] isEqual:playerPiece]) && ([_gameboard[3] isEqual:playerPiece]) && ([_gameboard[6] isEqual:playerPiece])){
            return YES;
        }
        // | |X| |
        // | |X| |
        // | |X| |
        if (([_gameboard[1] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[7] isEqual:playerPiece])){
            return YES;
        }
        // | | |X|
        // | | |X|
        // | | |X|
        if (([_gameboard[2] isEqual:playerPiece]) && ([_gameboard[5] isEqual:playerPiece]) && ([_gameboard[8] isEqual:playerPiece])){
            return YES;
        }
        // |X| | |
        // | |X| |
        // | | |X|
        if (([_gameboard[0] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[8] isEqual:playerPiece])){
            return YES;
        }
        // | | |X|
        // | |X| |
        // |X| | |
        if (([_gameboard[2] isEqual:playerPiece]) && ([_gameboard[4] isEqual:playerPiece]) && ([_gameboard[6] isEqual:playerPiece])){
            return YES;
        }
        
    }
    return NO;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Game *ticTacToe =[[Game alloc]init];
        [ticTacToe startGame];
        
        
    }
    return 0;
}
