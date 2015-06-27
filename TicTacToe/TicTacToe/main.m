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
-(BOOL)isEmpty;

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
    win = false;
    
    //fill gameboard with spaces
    gameBoard = [[NSMutableArray alloc] init];
    for (int i = 0; i < 9; i++) {
        [gameBoard addObject:@" "];
    }
    
    //print tutorial board
    [self printTutorialBoard];
    
    playerTurn = 1;
    while (win == false) {
        [self turn];
        [self printBoard];
    }
}

-(void)turn{
    if (playerTurn == 1) {
        NSLog(@"Player 1, make your move: ");
        int currentMove;
        scanf("%d",&currentMove);
        // integer currentMove is cast as an NSUInteger
        [gameBoard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"X"];
        playerTurn = 2;
    }
    else {
        NSLog(@"Player 2, make your move: ");
        int currentMove;
        scanf("%d",&currentMove);
        // integer currentMove is cast as an NSUInteger
        [gameBoard replaceObjectAtIndex:(NSUInteger)currentMove withObject:@"O"];
        playerTurn = 1;
    }

}


//-(BOOL)isEmpty;

//-(BOOL)checkWin;

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        game *ticTacToe =[[game alloc]init];
        
        [ticTacToe startGame];
        
        
        
        
        
    }
    return 0;
}
