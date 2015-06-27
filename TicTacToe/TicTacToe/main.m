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
        
        char userXOrO;
        char otherUserXOrO;
        
        while (true) {
            
            NSLog(@"Choose X or O: ");
            fpurge(stdin);
            scanf("%c", &userXOrO);
            
            if ( (userXOrO == 'x') || (userXOrO == 'X') || (userXOrO == 'o') || (userXOrO == 'O') ) {
                
                if (userXOrO == 'x' || userXOrO =='X') {
                    userXOrO = 'X';
                    otherUserXOrO = 'O';
                }
                else {
                    userXOrO = 'O';
                    otherUserXOrO = 'X';
                }
                
                break;
            }
        }
        
        while (true) {
            
            int hPosition = -1;
            int vPosition = -1;
//            NSInteger *hPosition;
//            NSInteger *vPosition;
            NSLog(@"Choose your horizontal position (1-3): ");
            fpurge(stdin);
            scanf("%d", &hPosition);

            if (hPosition < 1 || hPosition > 3) {
                NSLog(@"Please enter a valid position between 1 and 3");
                continue;
            }
            
            NSLog(@"Choose your vertical position (1-3): ");
            fpurge(stdin);
            scanf("%d", &vPosition);
            
            if (vPosition < 1 || vPosition > 3) {
                NSLog(@"Please enter a valid position betwwwn 1 and 3");
            }
            
            NSLog(@"%d %d", hPosition, vPosition);
            
            // Pass in this position into our class and then check if it's empty and if so place this person's x or o into the board
            
            break;
            
            
            
        }
        

    }
    return 0;
}
