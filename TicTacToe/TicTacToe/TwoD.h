//
//  TwoD.h
//  TicTacToe
//
//  Created by Varindra Hart on 7/1/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TwoD : NSObject{
NSMutableArray *Rows;
}
-(instancetype)initWithRows:(int)rows columns:(int)columns;
-(id)objectAtRow:(int)row column:(int)column;
-(void)setObject:(NSString *)object atRow:(int)row column:(int)column;
-(int)count;
-(int)rowSum:(int)rowNumber;
-(int)columnSum:(int)columnNumber;
-(int)diagonalSum:(int)topCorner;

@end