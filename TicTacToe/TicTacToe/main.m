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
-(void)turn;






@end

@implementation game{

NSArray *gameBoard[9];
BOOL *win;
NSInteger *difficult;


}
-(void) printBoard {
	NSLog(@"Blah");
}
-(void)startGame {
NSLog(@"Welcome to Derek's and Eric's TicTacToe!");
[self printBoard];
}


//-(BOOL)isEmpty;
//-(void)printGame;
//-(void)turn;
//-(BOOL)checkWin;

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
		
		game *ticTacToe =[[game alloc]init];
		
		[ticTacToe startGame];
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
    }
    return 0;
}
