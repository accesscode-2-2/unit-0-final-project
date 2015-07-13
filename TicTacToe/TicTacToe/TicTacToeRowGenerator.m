//
//  TicTacToeRowGenerator.m
//  TicTacToe
//
//  Created by Z on 7/13/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "TicTacToeRowGenerator.h"
#import "NSString+isNumeric.h"

@implementation TicTacToeRowGenerator

+ (NSMutableArray *)allLinesForDirection:(Direction)direction
                                withGame:(NSArray *)gameBoard {
    
    // check if valid gameboard
    // check if valid direction

    switch (direction) {
        case Horizonal:
            return [self horizontalLinesForGame:gameBoard];
        case Vertical:
            return [self verticalLinesForGame:gameBoard];
        case Diagonal:
            return [self diagonalLinesForGame:gameBoard];
    }
}

+ (NSMutableArray *)horizontalLinesForGame:(NSArray *)gameBoard {
    
    NSInteger sizeOfGame = sqrt(gameBoard.count);
    NSMutableArray *lines = [[NSMutableArray alloc] init];
    
        
    // this sucks it's state
    NSMutableArray *line = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < gameBoard.count; i++) {
        
        NSString *currentVal = [gameBoard objectAtIndex:i];
        [line addObject:currentVal];
        
        if ([line count] == sizeOfGame) { //line array reaches the gameSize
            [lines addObject:[NSArray arrayWithArray:line]];
            [line removeAllObjects];
        }
    }
    
    return lines;
}

+ (NSMutableArray *)verticalLinesForGame:(NSArray *)gameBoard {
    NSInteger sizeOfGame = sqrt(gameBoard.count);
    
    NSMutableArray *lines = [[NSMutableArray alloc] init];
    
    NSInteger currentIndex;
    NSInteger lastIndex;
    
    for (int i = 0; i < sizeOfGame; i++) {
        currentIndex = i;
        lastIndex = 0;
        NSMutableArray *line = [[NSMutableArray alloc] init];
        for (int i = 0; i < sizeOfGame; i++) {
            [line addObject:[gameBoard objectAtIndex:currentIndex]];
            lastIndex = currentIndex;
            currentIndex = lastIndex + sizeOfGame;
        }
        
        [lines addObject:line];
    }
    
    return lines;
}

+ (NSMutableArray *)diagonalLinesForGame:(NSArray *)gameBoard {
    
    NSInteger sizeOfGame = sqrt(gameBoard.count);
    NSMutableArray *lines = [[NSMutableArray alloc] init];
    
    NSInteger currentIndex = 0;
    NSInteger lastIndex = 0;
    
    NSMutableArray *line = [[NSMutableArray alloc] init];
    for (int i = 0; i < sizeOfGame; i++) {
        [line addObject:[gameBoard objectAtIndex:currentIndex]];
        lastIndex = currentIndex;
        currentIndex = lastIndex + sizeOfGame + 1;
    }
    
    [lines addObject:line];
    
    currentIndex = sizeOfGame - 1;
    lastIndex = sizeOfGame - 1;
    
    for (int i = 0; i < sizeOfGame; i++) {
        [line addObject:[gameBoard objectAtIndex:currentIndex]];
        lastIndex = currentIndex;
        currentIndex = lastIndex + sizeOfGame - 1;
    }
    
    [lines addObject:line];
    
    return lines;
}


@end
