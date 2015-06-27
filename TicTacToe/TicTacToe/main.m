//
//  main.m
//  TicTacToe
//
//  Created by Henna and Kaisha  on 6/27/15.
//

#import <Foundation/Foundation.h>

@interface ticTacToeManager : NSObject

-(void) initializeArray: (int) dimension;
-(void) printBoard;

@end

@implementation ticTacToeManager{
    NSMutableArray *_board;
}

-(void) initializeArray: (int) dimension{
    
    _board = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<dimension; i++) {
        NSArray * row = [NSArray arrayWithObjects:@" ", @" ", @" ", nil];
        [_board addObject:row];
    }

//    NSLog(@"%@", _board);
}

-(void)printBoard {
    
    NSArray *row1 = [_board objectAtIndex:0];
    NSArray *row2 = [_board objectAtIndex:1];
    NSArray *row3 = [_board objectAtIndex:2];
    
    NSLog(@"\n\t\t|%@|%@|%@| \n\t\t|%@|%@|%@| \n\t\t|%@|%@|%@|", [row1 objectAtIndex:0], [row1 objectAtIndex:1], [row1 objectAtIndex:2], [row2 objectAtIndex:0], [row2 objectAtIndex:1], [row2 objectAtIndex:2], [row3 objectAtIndex:0], [row3 objectAtIndex:1], [row3 objectAtIndex:2]);
}



@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ticTacToeManager * game = [[ticTacToeManager alloc] init];
        
        [game initializeArray:3];
        [game printBoard];

    }
    return 0;
}
