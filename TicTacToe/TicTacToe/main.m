//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>



/////// TIC TAC TOE DECLATRATION ///////
@interface TicTacToe :NSObject;

- (void)printIntroudction;

- (int)introMessage;

- (void)printBoard;

- (void)playerOne;

- (void)playerTwo;

- (NSMutableArray *)board;

- (BOOL)correctCheck;

- (BOOL)oneVoneGameState:(int)num;

- (BOOL)onePlayerGameState:(int)num;

- (void)computerEasy;



@end


/////// TIC TAC TOE DEFINITION ///////
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

- (int)introMessage {
    printf(" \n\n");
    printf("///////////////////////////////////////////////////////////////////////////////// \n\n");
    printf("######## ####  ######     ########    ###     ######  ########  #######  ########\n");
    printf("   ##     ##  ##    ##       ##      ## ##   ##    ##    ##    ##     ## ##\n");
    printf("   ##     ##  ##             ##     ##   ##  ##          ##    ##     ## ##\n");
    printf("   ##     ##  ##             ##    ##     ## ##          ##    ##     ## ######\n");
    printf("   ##     ##  ##             ##    ######### ##          ##    ##     ## ##\n");
    printf("   ##     ##  ##    ##       ##    ##     ## ##    ##    ##    ##     ## ##\n");
    printf("   ##    ####  ######        ##    ##     ##  ######     ##     #######  ########\n");
    printf(" \n\n");
    printf("///////////////////////////////////////////////////////////////////////////////// \n");
    printf("////                                                                         //// \n");
    printf("////                        PRESS 1 for ONE PLAYER MODE                      //// \n");
    printf("////                                                                         //// \n");
    printf("////                        PRESS 2 for TWO PLAYER MODE                      //// \n");
    printf("////                                                                         //// \n");
    printf("////                                                                         //// \n");
    printf("////                                                                         //// \n");
    printf("///////////////////////////////////////////////////////////////////////////////// \n\n");
    
    int playerMode;
    printf("ENTER: ");
    scanf("%d", &playerMode);
    
    
    int mode;
    
    if (playerMode == 1){
        
        mode = 1;
        
    } else if (playerMode == 2) {
        
        mode = 2;
        
    } else {
        
        mode = 0;
    }
    
    return mode;
}

- (NSMutableArray *)board{
    
    _board = [NSMutableArray arrayWithObjects: @"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    
    return _board;
}



- (void)playerOne{
    
    printf("PLAYER ONE MOVE:  ");
    int x;
    scanf("%d", &x);
    printf("\n");
    
    if (x < 10){
        if (![[_board objectAtIndex:x - 1] isEqualToString:@"x"] && ![[_board objectAtIndex:x - 1] isEqualToString:@"o"]) {
            // valid input
            _board[x - 1] = @"x";
        } else {
            // already taken
            NSLog(@"this is already taken");
        }
    } else {
        printf("You inputted twice!");
    }
    
}

- (void)playerTwo {
    
    printf("PLAYER TWO MOVE:  ");
    int o;
    scanf("%d", &o);
    printf("\n");
    while(!(o < 10)){
        printf("Please pick a valid number: ");
        scanf("%d", &o);
        printf("\n");
        
    }
    
    do {
        
        if (!(o < 10)){
            printf("This is already taken!\n");
            printf("Please pick a valid number: ");
            scanf("%d", &o);
            printf("\n");
        }
        
        if (o < 10){
            if (![[_board objectAtIndex:o - 1] isEqualToString:@"x"] && ![[_board objectAtIndex:o - 1] isEqualToString:@"o"]) {
                // valid input
                _board[o - 1] = @"o";
            }
            else {
                printf("This is already taken!\n");
                printf("Please pick a valid number: ");
                scanf("%d", &o);
                printf("\n");
            }
            
        }
    } while (!(o < 10) || ([[_board objectAtIndex:o - 1] isEqualToString:@"x"] && ![[_board objectAtIndex:o - 1] isEqualToString:@"o"]) );
    
}

- (void)computerEasy {
    printf("COMPUTER MOVE:  ");
    
    NSMutableArray *emptySpaces = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < [_board count]; i++){
        NSString *currentVal = [_board objectAtIndex:i];
        
        if (![currentVal isEqualToString:@"x"] && ![currentVal isEqualToString:@"o"]){
            
            [emptySpaces addObject:@(i)];
        }
    }
    
    int fromNumber = 1;
    int toNumber = (int)[emptySpaces count];
    int randomNumber = (arc4random()%(toNumber-fromNumber))+fromNumber;
    
    int computerSelection = [[emptySpaces objectAtIndex:randomNumber] integerValue];
    _board[computerSelection] = @"o";
    
    
    
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


- (BOOL)oneVoneGameState:(int)num{
    
    [self board]; // array
    int tries = 0;
    int maxTries = 20;
    while (tries < maxTries){
        
        [self playerOne];
        
        [self printBoard];
        
        if ([self correctCheck]) {
            break;
        }
        
        
        [self playerTwo];
        
        [self printBoard];
        
        if ([self correctCheck]) {
            break;
        }
        
        tries++;
        
    }
    
    return true;
}

- (BOOL)correctCheck {
    
    ////// HORIZONTAL CHECK
    
    BOOL win = false;
    
    // FIRST ROW
    
    if([[_board objectAtIndex:0] isEqualToString:@"x"] && [[_board objectAtIndex:1] isEqualToString:@"x"] && [[_board objectAtIndex:2] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:0] isEqualToString:@"o"] && [[_board objectAtIndex:1] isEqualToString:@"o"] && [[_board objectAtIndex:2] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    // SECOND ROW
    
    if([[_board objectAtIndex:3] isEqualToString:@"x"] && [[_board objectAtIndex:4] isEqualToString:@"x"] && [[_board objectAtIndex:5] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:3] isEqualToString:@"o"] && [[_board objectAtIndex:4] isEqualToString:@"o"] && [[_board objectAtIndex:5] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    // THIRD ROW
    
    if([[_board objectAtIndex:6] isEqualToString:@"x"] && [[_board objectAtIndex:7] isEqualToString:@"x"] && [[_board objectAtIndex:8] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:6] isEqualToString:@"o"] && [[_board objectAtIndex:7] isEqualToString:@"o"] && [[_board objectAtIndex:8] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    
    ////// VERTICAL CHECK
    
    // FIRST COLUMN
    
    if([[_board objectAtIndex:0] isEqualToString:@"x"] && [[_board objectAtIndex:3] isEqualToString:@"x"] && [[_board objectAtIndex:6] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:0] isEqualToString:@"o"] && [[_board objectAtIndex:3] isEqualToString:@"o"] && [[_board objectAtIndex:6] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    // SECOND COLUMN
    
    if([[_board objectAtIndex:1] isEqualToString:@"x"] && [[_board objectAtIndex:4] isEqualToString:@"x"] && [[_board objectAtIndex:7] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:1] isEqualToString:@"o"] && [[_board objectAtIndex:4] isEqualToString:@"o"] && [[_board objectAtIndex:7] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    // THIRD COLUMN
    
    if([[_board objectAtIndex:2] isEqualToString:@"x"] && [[_board objectAtIndex:5] isEqualToString:@"x"] && [[_board objectAtIndex:8] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:2] isEqualToString:@"o"] && [[_board objectAtIndex:5] isEqualToString:@"o"] && [[_board objectAtIndex:8] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    
    ////// DIAGONAL CHECK
    
    //     \\\\
    //      \\\\
    //     --------
    //      \ \ \ \
    //        \ \ \
    //          \ \
    //            \
    
    if([[_board objectAtIndex:0] isEqualToString:@"x"] && [[_board objectAtIndex:4] isEqualToString:@"x"] && [[_board objectAtIndex:8] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:0] isEqualToString:@"o"] && [[_board objectAtIndex:4] isEqualToString:@"o"] && [[_board objectAtIndex:8] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    //         ////
    //        ////
    //      --------
    //      / / / /
    //      / / /
    //      / /
    //      /
    
    if([[_board objectAtIndex:2] isEqualToString:@"x"] && [[_board objectAtIndex:4] isEqualToString:@"x"] && [[_board objectAtIndex:6] isEqualToString:@"x"]){
        
        printf("Player X wins!");
        win = true;
    }
    
    else if ([[_board objectAtIndex:2] isEqualToString:@"o"] && [[_board objectAtIndex:4] isEqualToString:@"o"] && [[_board objectAtIndex:6] isEqualToString:@"o"]) {
        
        printf("Player O wins!");
        win = true;
        
    }
    
    return win;
}

- (BOOL)onePlayerGameState:(int)num{
    
    [self board]; // array
    int tries = 0;
    int maxTries = 20;
    while (tries < maxTries){
        
        [self playerOne];
        
        [self printBoard];
        
        if ([self correctCheck]) {
            break;
        }
        
        
        [self computerEasy];
        
        [self printBoard];
        
        if ([self correctCheck]) {
            break;
        }
        
        
        
        tries++;
        
    }
    
    return true;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        TicTacToe *tictactoe = [[TicTacToe alloc]init];
        
        int playerChoose = [tictactoe introMessage];
        
        if (playerChoose == 2){
            
            [tictactoe printIntroduction];
            
            [tictactoe oneVoneGameState:0];
        }
        
        else if (playerChoose == 1){
            
            [tictactoe printIntroduction];
            
            [tictactoe onePlayerGameState:0];
        }
        
        
        
    }
    return 0;
}



