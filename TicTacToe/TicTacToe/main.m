//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TicTacToe :NSObject;

- (void)printIntroudction;

- (void)printBoard;

- (int)playerMove:(int)x;

- (NSMutableArray *)board;


@end


@implementation TicTacToe {
    NSMutableArray * _board;
}

- (void)printIntroduction{
    
    printf( "\n\n\tTic Tac Toe\n\n");
    printf( "Player 1 (X)  -  Player 2 (O) \n \n");
    printf("\n");
    printf( "     |     |     \n" );
    printf( " [1] | [2] | [3] \n");
    printf( "_____|_____|_____\n") ;
    printf( "     |     |     \n") ;
    printf( " [4  | [5] | [6] \n");
    printf( "_____|_____|_____\n") ;
    printf( "     |     |     \n") ;
    printf( " [7] | [8] | [9] \n");
    printf( "     |     |     \n \n") ;
    
};

- (int)playerMove:(int)x{
    
    printf("Please pick a number where you want to put your move:  ");
    int num;
    scanf("%d", &num);
    printf("\n");
    
    return num;
}

- (NSMutableArray *)board{
    
    _board = [NSMutableArray arrayWithObjects: @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    return _board;
}

- (void)printBoard {
    
    
    printf("\n");
    printf("     |     |     \n" );
    printf(" [%s] | [%s] | [%s] \n", [_board[0] UTF8String], [_board[1] UTF8String], [_board[2]UTF8String]);
    printf("_____|_____|_____\n")  ;
    printf("     |     |     \n") ;
    printf(" [%s] | [%s] | [%s] \n", [_board[3] UTF8String], [_board[4] UTF8String], [_board[5]UTF8String]);
    printf("_____|_____|_____\n") ;
    printf("     |     |     \n") ;
    printf(" [%s] | [%s] | [%s] \n", [_board[6] UTF8String], [_board[7] UTF8String],[_board[8] UTF8String]);
    printf("     |     |     \n \n") ;
    
    
}



@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        


        TicTacToe *tictactoe = [[TicTacToe alloc]init];
        
        [tictactoe printIntroduction];
        
        [tictactoe board];
        
        [tictactoe printBoard];



        

        
        for (int i = 0; i < 9; i++){
            NSLog(@"user selection: %d, current value: %d", x, i);
            NSLog(@"%@", board);
            if (x == i+1){
                board[i] = @"x";
            }
        }


// make object tic tac toe
// in while loop -
// hey tic tac toe print board
// inside while loop get # from user
// hey tic tac toe make move
        
        
    }
    return 0;
}



