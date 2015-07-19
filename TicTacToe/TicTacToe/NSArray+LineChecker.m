//
//  NSArray+LineChecker.m
//  TicTacToe
//
//  Created by Z on 7/7/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "NSArray+LineChecker.h"

@implementation NSArray (LineChecker)

-(BOOL) areAllObjectsAreIdentical{ //category method for NSArray
    NSSet *set = [NSSet setWithArray:self];
    return ([set count] <= 1);
}

@end
