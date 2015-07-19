//
//  MyTicTacToeGame.h
//  TicTacToe
//
//  Created by Z on 7/7/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;

@interface MyTicTacToeGame: NSObject

+ (void)printBoard:(Game *)game;
+ (void)printTutorialBoard:(Game *)game;

@end
