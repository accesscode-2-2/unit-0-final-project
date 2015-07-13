//
//  TicTacToeRowGenerator.h
//  TicTacToe
//
//  Created by Z on 7/13/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, Direction) {
    Horizonal,
    Vertical,
    Diagonal
};

@interface TicTacToeRowGenerator : NSObject

+ (NSMutableArray *)allLinesForDirection:(Direction)direction
                                withGame:(NSArray *)gameBoard;

@end
