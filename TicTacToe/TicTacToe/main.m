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
-(BOOL) isPositionValidX: (int) x AndY: (int) y and: (char) userPosition userType: (BOOL) isComputer;
-(BOOL) isWinner;
-(BOOL) isFull;

@end

@implementation ticTacToeManager{
    NSMutableArray *_board;
}

-(void) initializeArray: (int) dimension{
    
    _board = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<dimension; i++) {
        NSMutableArray * row = [NSMutableArray arrayWithObjects:@" ", @" ", @" ", nil];
        [_board addObject:row];
    }
}

-(void)printBoard {
    
    NSArray *row1 = [_board objectAtIndex:0];
    NSArray *row2 = [_board objectAtIndex:1];
    NSArray *row3 = [_board objectAtIndex:2];
    
    NSLog(@"\n\t\t|%@|%@|%@| \n\t\t|%@|%@|%@| \n\t\t|%@|%@|%@|", [row1 objectAtIndex:0], [row1 objectAtIndex:1], [row1 objectAtIndex:2], [row2 objectAtIndex:0], [row2 objectAtIndex:1], [row2 objectAtIndex:2], [row3 objectAtIndex:0], [row3 objectAtIndex:1], [row3 objectAtIndex:2]);
}

-(BOOL) isPositionValidX: (int) x AndY: (int) y and: (char) userPosition userType: (BOOL) isComputer{
    
    x = x-1;    // this is the position on the row-array we want to check
    y = y-1;    // this is the position in our board array we want the row-array from
    
    if ([[[_board objectAtIndex:y] objectAtIndex:x] isEqualTo:@" "]) { // get row-array from board, get element from row-array and then compare
        if (userPosition == 'X') {
            
            [[_board objectAtIndex:y] replaceObjectAtIndex:x withObject:@"X"];
            
        }
        else{
            [[_board objectAtIndex:y] replaceObjectAtIndex:x withObject:@"O"];
        }
        return YES;
    }
    else if(isComputer) {
        return NO;
    }
    else {
        NSLog(@"This is a not valid position");
        return NO;
    }
    
}

-(BOOL) isWinner {
    NSString *winner;
    
    //horizontal cases
    
    for (int i =0; i<3; i++) {
        if( [[[_board objectAtIndex:i] objectAtIndex:0] isEqualToString: [[_board objectAtIndex:i] objectAtIndex:1]] &&
            [[[_board objectAtIndex:i] objectAtIndex:1] isEqualToString: [[_board objectAtIndex:i] objectAtIndex:2]] &&
            ![[[_board objectAtIndex:i] objectAtIndex:0] isEqualToString: @" "]
           ){
            
            winner = [[_board objectAtIndex:i] objectAtIndex:0];
            NSLog(@"%@ won", winner);
            return YES;
            
        }
        
    }
    
    //vertical cases
    
    for ( int i = 0; i < 3; i++) {
        if( [[[_board objectAtIndex:0] objectAtIndex:i] isEqualToString: [[_board objectAtIndex:1] objectAtIndex:i]] &&
           [[[_board objectAtIndex:1] objectAtIndex:i] isEqualToString: [[_board objectAtIndex:2] objectAtIndex:i]] &&
           ![[[_board objectAtIndex:0] objectAtIndex:i] isEqualToString: @" "]
           ){
            winner = [[_board objectAtIndex:0] objectAtIndex:i];
            NSLog(@"%@ won", winner);
            return YES;
            
        
        }
    }
    
    //diagnol case
    if ([[[_board objectAtIndex:0] objectAtIndex:0] isEqualToString: [[_board objectAtIndex:1] objectAtIndex:1]] &&
        [[[_board objectAtIndex:1] objectAtIndex:1] isEqualToString: [[_board objectAtIndex:2] objectAtIndex:2]] &&
        ![[[_board objectAtIndex:0] objectAtIndex:0] isEqualToString: @" "]
        ){
        winner = [[_board objectAtIndex:0] objectAtIndex:0];
        NSLog(@"%@ won", winner);
        return YES;
        
        }
    //backwards diagnol case
    if ([[[_board objectAtIndex:0] objectAtIndex:2] isEqualToString: [[_board objectAtIndex:1] objectAtIndex:1]] &&
        [[[_board objectAtIndex:1] objectAtIndex:1] isEqualToString: [[_board objectAtIndex:2] objectAtIndex:0]] &&
        ![[[_board objectAtIndex:0] objectAtIndex:2] isEqualToString: @" "]
        ){
        winner = [[_board objectAtIndex:0] objectAtIndex:2];
        NSLog(@"%@ won", winner);
        return YES;
        
    }
    
    return NO;
}

-(BOOL) isFull {
    for (int i = 0; i < 3; i ++) {
        if (    [ [ [_board objectAtIndex:i] objectAtIndex:0] isEqualToString: @" "] ||
                [ [ [_board objectAtIndex:i] objectAtIndex:1] isEqualToString: @" "] ||
                [ [ [_board objectAtIndex:i] objectAtIndex:2] isEqualToString: @" "]
            ){
            
            return NO;
        }
    
        }
        NSLog(@"No more plays, game over :(");
            return YES;

}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ticTacToeManager * game = [[ticTacToeManager alloc] init];
        
        [game initializeArray:3];
        
        
        char xOrO;
        
        while (true) {
            
            NSLog(@"Choose X or O: ");
            fpurge(stdin);
            scanf("%c", &xOrO);
            
            if ( (xOrO == 'x') || (xOrO == 'X') || (xOrO == 'o') || (xOrO == 'O') ) {
                
                if (xOrO == 'x' || xOrO =='X') {
                    xOrO = 'X';
                }
                else {
                    xOrO = 'O';
                }
                
                break;
            }
        }
        
        
        [game printBoard];
        
        BOOL computerTurn = NO;
        
        while (true) {
            
            int hPosition = -1;
            int vPosition = -1;
            
            
            if (computerTurn) {

                hPosition = 1 + arc4random_uniform(3);
                vPosition = 1 + arc4random_uniform(3);
                
                NSLog(@"%d %d", hPosition, vPosition );
                
                //pick a hposition and vposition for computer
            }
            
            else{

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
                    NSLog(@"Please enter a valid position between 1 and 3");
                    continue;
                }
            }
            
            
            // Pass in this position into our class and then check if it's empty and if so place this person's x or o into the board
            
            if ([game isPositionValidX:hPosition AndY:vPosition and:xOrO userType:computerTurn ]){
                if (computerTurn == YES) {
                    computerTurn = NO;
                }
                else{
                    computerTurn = YES;
                }
                if (xOrO == 'X') {  //After each iteration we want to change the postion to X or back to O
                    xOrO = 'O';
                }
                else{
                    xOrO = 'X';
                }
                
                [game printBoard];
            }

            BOOL won = [game isWinner];
            BOOL full = [game isFull];
            
            if (won || full) {
                break;
            }
            
            
            
        }
        
        
    }
    return 0;
}
