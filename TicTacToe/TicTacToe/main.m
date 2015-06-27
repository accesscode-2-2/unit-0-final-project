//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableArray *board = [[NSMutableArray alloc] init];
        [board insertObject:[NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil] atIndex:0];
        [board insertObject:[NSMutableArray arrayWithObjects:@"4", @"5", @"6", nil] atIndex:1];
        [board insertObject:[NSMutableArray arrayWithObjects:@"7", @"8", @"9", nil] atIndex:2];
        
        NSString *decision = @"X";
        board[0][0] = decision;
    
        
        
            for (int i = 0; i < 3 ; i++) {
                int j = 0;
                NSString *rowColumn = [NSString stringWithFormat:@"%@ | %@ | %@", board[i][j], board[i][j+1], board[i][j+2]];
                NSLog(@"%@", rowColumn);
                
                if (i < 2){
                NSLog(@"---------");
                }
    
                
            }
        
        
        

        
        
        return 0;
    }
}
