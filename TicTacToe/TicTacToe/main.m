//
//  main.m
//  TicTacToe
//
//  Created by Henna and Kaisha  on 6/27/15.
//

//Henna:
//include a way to check for no more plays

//Kaisha:
//keep track of players and score
//take in player's name and let them know they won


#import <Foundation/Foundation.h>

@interface ticTacToeManager : NSObject

-(void) initializeArray: (int) dimension;
-(void) printBoard;
-(BOOL) isPositionValid: (int) horizontal And: (int) vertical AndIs: (char) userPosition WithUserType: (BOOL) isComputer;
-(BOOL) isWinner;
-(BOOL) isFull;



@end



@implementation ticTacToeManager{
    NSMutableArray *_board;
}

-(void) initializeArray: (int) dimension{
    //NSMutableArray *array = [[NSMutableArray alloc]init];
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

-(BOOL) isPositionValid: (int) horizontal And: (int) vertical AndIs: (char) userPosition WithUserType: (BOOL) isComputer{

    horizontal = horizontal-1;    // this is the position on the row-array we want to check
    vertical = vertical-1;    // this is the position in our board array we want the row-array from
    
    if ([[[_board objectAtIndex:vertical] objectAtIndex: horizontal] isEqualTo:@" "]) { // get row-array from board, get element from row-array and then compare
        if (userPosition == 'X') {
            
            [[_board objectAtIndex:vertical] replaceObjectAtIndex:horizontal withObject:@"X"];
            
        }
        else{
            [[_board objectAtIndex:vertical] replaceObjectAtIndex:horizontal withObject:@"O"];
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
        if ([ [ [_board objectAtIndex:i] objectAtIndex:0] isEqualToString: @" "] ||
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

@interface Person : NSObject

-(void)setName:(NSString *)name;

-(void)won;



@end


@implementation Person { // class
    
    // instance variable
    NSString *_name;
    int _pointsEarned;
}
    // methods

-(void)setName:(NSString *)name {
    
    _name = name;
    _pointsEarned = 0;
    
}

-(void)won{
    _pointsEarned = _pointsEarned + 1;
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        BOOL playingAgain = YES; //
        
        
        while (playingAgain) {
            ticTacToeManager * game = [[ticTacToeManager alloc] init];
            
            [game initializeArray:3];
            
            
            char xOrO;                  //first user chooses the position X or O
            int onePlayerChoice;        //user choice to play one player game or two player game
            BOOL onePlayer;             //onePlayer or twoPlayer
            BOOL computerTurn = NO;     //initialize computerTurn to NO
            BOOL won;
            BOOL full;
            
            
            
            while (true) {
                
                NSLog(@"Type 1 for a one player game and 2 for two-player game: ");
                fpurge(stdin);
                scanf("%d", &onePlayerChoice);
                
                if ( onePlayerChoice == 1 ) {
                    onePlayer = YES;
                    break;
                }
                else if (onePlayerChoice == 2){
                    onePlayer = NO;
                    break;
                }
                else{
                    NSLog(@"Please enter a valid number of players");
                    continue;
                }
            }
            
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
                else {
                    continue;
                }
            }
            
            
            [game printBoard];
            
            
            
            while (true) {
                
                int hPosition;
                int vPosition;
                
                if (onePlayer && computerTurn) {
                    
                    hPosition = 1 + arc4random_uniform(3);
                    vPosition = 1 + arc4random_uniform(3);
                }
                
                else{
                    
                    NSLog(@"%c's turn", xOrO);
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
                
                //if ([game isPositionValidX:hPosition AndY:vPosition and:xOrO userType:computerTurn ]){
               
                //-(BOOL) isPositionValid: (int) horizontal And: (int) vertical AndIs: (char) userPosition WithUserType: (BOOL) isComputer;

                if([game isPositionValid: hPosition  And: vPosition AndIs: xOrO WithUserType:computerTurn ]){
                if (onePlayer) {
                        if (computerTurn == YES) {
                            computerTurn = NO;
                        }
                        else{
                            computerTurn = YES;
                        }
                    }
                    if (xOrO == 'X') {  //After each iteration we want to change the postion to X or back to O
                        xOrO = 'O';
                    }
                    else{
                        xOrO = 'X';
                    }
                    
                    [game printBoard];
                }
                
                won = [game isWinner];
                full = [game isFull];
                
                if (won || full) {
                    break;
                    
                }
                else{
                    continue;
                }
            }
            
            
            
            
            while (true) {
                char playAgain;
                NSLog(@"Do you want to play again?(Y for yes and N for no: ");
                fpurge(stdin);
                scanf("%c", &playAgain);
                
                if ( (playAgain == 'y') || (playAgain == 'Y') ) {
                    playingAgain = YES;
                    break;
                }
                else if ((playAgain == 'n') || (playAgain == 'N')){
                    
                    playingAgain = NO;
                    NSLog(@"Thanks for playing!");
                    return 0;
                    
                }
                else{
                    continue;
                }
                
            }
            
            
        } // end of playingAgain while LOOP
        
        
    }

    //return 0;

    
}
