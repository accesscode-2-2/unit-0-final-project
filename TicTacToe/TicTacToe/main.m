//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyTicTacToeGame.h"
#import "TicTacToeRowGenerator.h"
#import "Game.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Game *ticTacToe =[[Game alloc]init];
        
        //set game mode
        BOOL modeSet = NO;
        while (modeSet == NO) {
            NSLog(@"Select Game Mode:");
            NSLog(@"    1) Player vs. Player");
            NSLog(@"    2) Player vs. Computer");
            NSLog(@"    3) Computer vs. Computer");
            int userGameMode;
            scanf("%d",&userGameMode);
            fpurge(stdin);
            
            if (userGameMode == 1) {
                [ticTacToe setMode:1];
                modeSet = YES;
            }
            else if (userGameMode == 2){
                [ticTacToe setMode:2];
                modeSet = YES;
            }
            else if (userGameMode == 3){
                [ticTacToe setMode:3];
                modeSet = YES;
            }
            else {
                NSLog(@"Invalid game mode.");
            }
        }
        
        //set difficulty
        if ([ticTacToe getMode] == 2) {
            BOOL difficultySet = NO;
            while (difficultySet == NO && [ticTacToe getMode] != 1) {
                NSLog(@"Choose a difficulty.");
                NSLog(@"    1) Easy");
                NSLog(@"    2) Medium");
                NSLog(@"    3) Hard");
                int userDifficulty;
                scanf("%d",&userDifficulty);
                fpurge(stdin);
                
                if (userDifficulty == 1) {
                    [ticTacToe setDifficulty:1];
                    difficultySet = YES;
                }
                else if (userDifficulty == 2){
                    [ticTacToe setDifficulty:2];
                    difficultySet = YES;
                }
                else if (userDifficulty == 3){
                    [ticTacToe setDifficulty:3];
                    difficultySet = YES;
                }
            }
        }
        //set game size
        if ([ticTacToe getMode] == 1) {
            BOOL gameSizeSet = NO;
            while (gameSizeSet == NO) {
                NSLog(@"Set a game size from 3-10, fool!:");
                int userGameSize;
                scanf("%d",&userGameSize);
                fpurge(stdin);
                
                if (userGameSize >=3 && userGameSize <= 10) {
                    [ticTacToe setGameSize:userGameSize];
                    gameSizeSet = YES;
                }
                else{
                    NSLog(@"Invalid size.");
                }
            }
        }
        else{
            [ticTacToe setGameSize:3]; //Computer only works with game size of 3
        }
        
        [ticTacToe setupGame];
        
        [MyTicTacToeGame printTutorialBoard:ticTacToe];

        while (![ticTacToe checkWin] && ![ticTacToe checkDraw]) {
//            NSLog(@"%@", [TicTacToeRowGenerator allLinesForDirection:Horizonal withGame:[ticTacToe getGameBoard]]);
            [ticTacToe turn];
            [MyTicTacToeGame printBoard:ticTacToe];
        }
        
        if ([ticTacToe getWin]) {
            if ([ticTacToe getTurnCount] % 2 != 0) {
                NSLog(@"Player ~X Wins!");
            }
            else{
                NSLog(@"Player ~O Wins!");
            }
        }
        else{
            NSLog(@"It's a draw.");
        }
    }
    
    return 0;
}

