//
//  ComputerPlayer.m
//  TicTacToe
//
//  Created by Z on 7/11/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ComputerPlayer.h"

@implementation ComputerPlayer


//                //Easy Mode computer move
//                if (_difficulty == 1) {
//                    int computerMove = arc4random_uniform(_maxIndex + 1);
//                    if ((![[_gameboard objectAtIndex:computerMove]  isEqual: @"~X"]) && (![[_gameboard objectAtIndex:computerMove]  isEqual: @"~O"])) {
//                        NSLog(@"Computer is making a move...");
//                        sleep(1.5);
//                        [_gameboard replaceObjectAtIndex:(NSUInteger)computerMove withObject:@"~O"];



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
@end
