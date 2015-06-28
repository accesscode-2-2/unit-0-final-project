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

- (void)playerMove;

- (NSMutableArray *)board;

- (BOOL)gameState:(int)tries;

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
    
}

- (NSMutableArray *)board{
    
    _board = [NSMutableArray arrayWithObjects: @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    return _board;
}



- (void)playerMove{
    
    printf("Please pick a number where you want to put your move:  ");
    int x;
    scanf("%d", &x);
    printf("\n");
    
    for (int i = 0; i < 9; i++){
        NSLog(@"user selection: %d, current value: %d", x, i);
        NSLog(@"%@", _board);
        if (x == i+1){
            _board[i] = @"x";
        }
    }
    
    
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


- (BOOL)gameState:(int)tries{
    
    [self board];
    int maxTries = 9;
    while (tries < maxTries){
        
        [self playerMove];
        
        [self printBoard];
        
        int horizontalCorrect1 = 0;
        int horizontalCorrect2 = 0;
        int horizontalCorrect3 = 0;
        
        // vertical check
        for (int i = 0; i < [_board count]; i = i + 3) {
            
            if([ _board[i] isEqualToString:@"x"]){
                horizontalCorrect1++;
            }
            
            if([_board[i+1] isEqualToString:@"x"]){
                horizontalCorrect2++;
            }
            
            if ([_board[i+2] isEqualToString:@"x"]){
                horizontalCorrect3++;
            }
            
            if (horizontalCorrect1 == 3 || horizontalCorrect2 == 3 || horizontalCorrect3 == 3){
                printf("WIN WIN WIN WIN WIN!");
                break;
            }
            
            
        }
        
        // diagonal check
        
        for (int i = 0; i < [_board count]; i = i + 4) {
            
            if ([_board[i] isEqualToString: ])
        }
        
        tries++;
    }
    return true;
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        

        TicTacToe *tictactoe = [[TicTacToe alloc]init];

        [tictactoe printIntroduction];
        
        [tictactoe gameState:0];
        
        
        
    }
    return 0;
}



