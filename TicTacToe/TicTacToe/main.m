//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface game:NSObject
//This is all the possible messages for the game class.
-(BOOL)checkWin;
-(void)startGame;

-(void)printBoard;
-(void)printTutorialBoard;

-(void)turn;

@end

@implementation game{
    NSMutableArray *gameBoard;
    BOOL *win;
    NSInteger *difficult;
    int playerTurn;
}

-(void)printTutorialBoard{
    NSLog(@"|0|1|2|");
    NSLog(@"|3|4|5|");
    NSLog(@"|6|7|8|");
}


-(void) printBoard {
    NSLog(@"|%@|%@|%@|",[gameBoard objectAtIndex:0],[gameBoard objectAtIndex:1],[gameBoard objectAtIndex:2] );
    NSLog(@"|%@|%@|%@|",[gameBoard objectAtIndex:3],[gameBoard objectAtIndex:4],[gameBoard objectAtIndex:5] );
    NSLog(@"|%@|%@|%@|",[gameBoard objectAtIndex:6],[gameBoard objectAtIndex:7],[gameBoard objectAtIndex:8] );
    
}
-(void)startGame {
    NSLog(@"Welcome to Derek's and Eric's TicTacToe!");
    win = NO;
    
    //fill gameboard with spaces
    gameBoard = [[NSMutableArray alloc] init];
    for (int i = 0; i < 9; i++) {
        [gameBoard addObject:@" "];
    }
    
    //print tutorial board
    [self printTutorialBoard];
    
    //Game Loop
    playerTurn = 1;
    while (win == NO) {
        [self turn];
    }
}

-(void)turn{
    while (playerTurn == 1) {
        NSLog(@"Player 1, make your move: ");
        int currentMove;
        scanf("%d",&currentMove);
        
        if (([gameBoard[currentMove] isEqual: @" "]) && (currentMove>=0) && (currentMove<=8)) {
            [gameBoard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"X"];
            playerTurn = 2;
        }
        else {
            NSLog(@"Invalid move. Enter a number from 0-8.");
        }
    }
    
    [self printBoard];
    
    while (playerTurn == 2) {
        NSLog(@"Player 2, make your move: ");
        int currentMove;
        scanf("%d",&currentMove);
        fpurge(stdin);
        
        if (([gameBoard[currentMove] isEqual: @" "]) && (currentMove>=0) && (currentMove<=8)) {
            [gameBoard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"O"];
            playerTurn = 1;
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
        }
        else{
            playerPiece = @"O";
        }
        
        // |X|X|X|
        // | | | |
        // | | | |
        if (([gameBoard[0] isEqual:playerPiece]) && ([gameBoard[1] isEqual:playerPiece]) && ([gameBoard[2] isEqual:playerPiece])){
            return YES;
        }
        // | | | |
        // |X|X|X|
        // | | | |
        if (([gameBoard[3] isEqual:playerPiece]) && ([gameBoard[4] isEqual:playerPiece]) && ([gameBoard[6] isEqual:playerPiece])){
            return YES;
        }
        // | | | |
        // | | | |
        // |X|X|X|
        if (([gameBoard[6] isEqual:playerPiece]) && ([gameBoard[7] isEqual:playerPiece]) && ([gameBoard[8] isEqual:playerPiece])){
            return YES;
        }
        // |X| | |
        // |X| | |
        // |X| | |
        if (([gameBoard[0] isEqual:playerPiece]) && ([gameBoard[3] isEqual:playerPiece]) && ([gameBoard[6] isEqual:playerPiece])){
            return YES;
        }
        // | |X| |
        // | |X| |
        // | |X| |
        if (([gameBoard[1] isEqual:playerPiece]) && ([gameBoard[4] isEqual:playerPiece]) && ([gameBoard[7] isEqual:playerPiece])){
            return YES;
        }
        // | | |X|
        // | | |X|
        // | | |X|
        if (([gameBoard[2] isEqual:playerPiece]) && ([gameBoard[5] isEqual:playerPiece]) && ([gameBoard[8] isEqual:playerPiece])){
            return YES;
        }
        // |X| | |
        // | |X| |
        // | | |X|
        if (([gameBoard[0] isEqual:playerPiece]) && ([gameBoard[4] isEqual:playerPiece]) && ([gameBoard[8] isEqual:playerPiece])){
            return YES;
        }
        // | | |X|
        // | |X| |
        // |X| | |
        if (([gameBoard[2] isEqual:playerPiece]) && ([gameBoard[4] isEqual:playerPiece]) && ([gameBoard[6] isEqual:playerPiece])){
            return YES;
        }
        
    }
    return NO;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        game *ticTacToe =[[game alloc]init];
        [ticTacToe startGame];
        
        
    }
    return 0;
}
