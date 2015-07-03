//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.

#import <Foundation/Foundation.h>
#import <unistd.h>


@interface TicTacToe : NSObject



-(void) setSingleOrMultiMode:(int *)singleOrMultiMode;
-(int *)singleOrMultiMode;



-(char)parseData:(NSString *)parsedData;
-(void) initializeArray: (int) boardsize;
-(void) printBoard: (NSString *)gridSize;
-(BOOL) winner;

@end


@implementation TicTacToe {
    NSMutableArray *boxes;
    
    NSString *_gridSize;
    int *_boardSize;
    NSString *_gameLevel;
    NSString *_singleOrMultiMode;
    NSString *_oXchoice;
    
}

-(void) initializeArray: (int) boardsize{
    _boardSize = &boardsize;
    boxes = [[NSMutableArray alloc] init];
    
    boxes = [NSMutableArray arrayWithCapacity:*_boardSize];
    for (int i=0; i<=*_boardSize; i++) {
        boxes[i] = @" ";
    }
}

-(void) printBoard: (NSString *)gridSize {
    _gridSize = gridSize;
    
    if ([_gridSize  isEqual: @"1"]) {
        
        NSLog (@" %@ | %@ | %@ ", boxes[0],boxes[1],boxes[2]);
        NSLog (@"-----------");
        NSLog (@" %@ | %@ | %@ ", boxes[3],boxes[4],boxes[5]);
        NSLog (@"-----------");
        NSLog (@" %@ | %@ | %@ ", boxes[6],boxes[7],boxes[8]);
        NSLog (@"\n\n\n\n");
    }
    else  if ([_gridSize  isEqual: @"2"]) {
        //working grid for playing the game
        NSLog (@"  %@  |  %@  |  %@  | %@ ", boxes[0],boxes[1],boxes[2],boxes[3]);
        NSLog (@"------------------------");
        NSLog (@"  %@  |  %@  |  %@  | %@ ", boxes[4],boxes[5],boxes[6],boxes[7]);
        NSLog (@"------------------------");
        NSLog (@"  %@  |  %@  |  %@  | %@ ", boxes[8],boxes[9],boxes[10],boxes[11]);
        NSLog (@"------------------------");
        NSLog (@"  %@  |  %@  |  %@  | %@ ", boxes[12],boxes[13],boxes[14],boxes[15]);
        
        NSLog (@"\n\n\n\n");
    }
    
    else if ([_gridSize  isEqual: @"3"]) {
        printf("\nDon't forget to write the code");
        // write codeeeeeeeeee
    }
    
}


- (void)first:(NSString *)singleOrMultiMode second:(NSString *)gameLevel third: (NSString *)oXchoice fourth: (NSString *)gridSize fifth: (int *)boardSize {
    _singleOrMultiMode = singleOrMultiMode;
    _gameLevel = gameLevel;
    _oXchoice = oXchoice;
    _gridSize = gridSize;
    _boardSize = boardSize;
    NSString *usersSymbol;
    int number = 0;
    int adjInputForOffset;
    BOOL wonTheGame = NO;
    BOOL computer = NO;
    
    
    
    //     single player  // level 1
    
    if ([_singleOrMultiMode  isEqual: @"1"] && [_gameLevel isEqual: @"1"] ) {
        
        for (int i =0; i<*_boardSize; i++){
            
            //run game until all boxes are filled up
            while ([boxes[i] isEqualTo:@" "]) {
                if (computer) {
                    //if random number is occupied, choose another random number
                    while ([boxes[number-1] isNotEqualTo:@" "]){
                        number = 1 + arc4random_uniform(*_boardSize);
                    }
                }
                else {
                    
                    printf("\nEnter a number \n");
                    scanf("%d", &number);
                    fpurge(stdin);
                    
                    if ((number <1) || (number > (*_boardSize + 1) )) {
                        printf("\nWrong choice! ");
                        continue;
                    }
                }
                
                /* variable for storing offset (better to fix it once here than possibly 100 other palces later )
                 check for empty boxes before entering user selected option if box is NOT "empty" tell user to slect a different box */
                
                adjInputForOffset = number-1;
                if ([boxes[adjInputForOffset] isNotEqualTo:@" "]){
                    printf("\nPlease choose another box\n");
                    //  transpose x's and o's
                    if ([_oXchoice isEqualToString:@"x"]){
                        _oXchoice = @"o";
                    }
                    else {
                        _oXchoice = @"x";
                    }
                }
                
                //if box is empty enter user selection
                else if ([boxes[adjInputForOffset] isEqualTo:@" "]){
                    boxes[adjInputForOffset] = _oXchoice;
                }
                
                
                if (computer == YES) {
                    computer = NO;
                }
                else{
                    computer = YES;
                }
                
                //  transpose x's and o's
                if ([_oXchoice isEqualToString:@"x"]){
                    _oXchoice = @"o";
                }
                else {
                    _oXchoice = @"x";
                }
                
                [self printBoard:_gridSize];
                
                
                wonTheGame = [self winner:_gridSize];
                
                
                if (!wonTheGame)
                    
                    continue;
                else
                    break;
                
            } // end of while loop
            if (!wonTheGame)
                
                continue;
            else
                break;
        } // end of        for (int i =0; i<*_boardSize; i++){
        
    } // end of     if (_singleOrMultiMode = 2 && _gameLevel == 1 )
    
    
    
    
    
    
    
    
    
    //     single player  // level 2 //3x3
    
    if ([_singleOrMultiMode  isEqual: @"1"] && [_gameLevel isEqual: @"2"] ) {
        
        for (int i =0; i<*_boardSize; i++){
            
            //run game until all boxes are filled up
            while ([boxes[i] isEqualTo:@" "]) {
                if (computer) {
                    //if random number is occupied, choose another random number
                    while ([boxes[number-1] isNotEqualTo:@" "]){
                        
                        //  get user' symbol
                        if ([_oXchoice isEqualToString:@"x"]){
                            usersSymbol = @"o";
                        }
                        else {
                            usersSymbol = @"x";
                        }
                        
                        
                        //conditions to block the user
                        if (
                            ([boxes[1] isEqualTo:usersSymbol] && [boxes[2] isEqualTo:usersSymbol] )
                            || ([boxes[4] isEqualTo:usersSymbol] && [boxes[8] isEqualTo:usersSymbol] )
                            || ([boxes[3] isEqualTo:usersSymbol] && [boxes[6] isEqualTo:usersSymbol] ))
                            number = 0;
                        else if ((([boxes[0] isEqualTo:usersSymbol] && [boxes[2] isEqualTo:usersSymbol]))
                                 || ([boxes[4] isEqualTo:usersSymbol] && [boxes[7] isEqualTo:usersSymbol]))
                            number = 1;
                        else if ((([boxes[0] isEqualTo:usersSymbol] && [boxes[1] isEqualTo:usersSymbol]))
                                 || ([boxes[4] isEqualTo:usersSymbol] && [boxes[6] isEqualTo:usersSymbol])
                                 || ([boxes[5] isEqualTo:usersSymbol] && [boxes[8] isEqualTo:usersSymbol]))
                            number = 2;
                        else if (([boxes[4] isEqualTo:usersSymbol] && [boxes[5] isEqualTo:usersSymbol])
                                 || ([boxes[0] isEqualTo:usersSymbol] && [boxes[6] isEqualTo:usersSymbol]))
                            number = 3;
                        else if (([boxes[3] isEqualTo:usersSymbol] && [boxes[5] isEqualTo:usersSymbol])
                                 || ([boxes[1] isEqualTo:usersSymbol] && [boxes[7] isEqualTo:usersSymbol])
                                 || ([boxes[0] isEqualTo:usersSymbol] && [boxes[8] isEqualTo:usersSymbol])
                                 || ([boxes[2] isEqualTo:usersSymbol] && [boxes[6] isEqualTo:usersSymbol]))
                            number = 4;
                        else if (([boxes[3] isEqualTo:usersSymbol] && [boxes[4] isEqualTo:usersSymbol])
                                 || ([boxes[2] isEqualTo:usersSymbol] && [boxes[8] isEqualTo:usersSymbol]))
                            number = 5;
                        else if (([boxes[7] isEqualTo:usersSymbol] && [boxes[8] isEqualTo:usersSymbol])
                                 || ([boxes[0] isEqualTo:usersSymbol] && [boxes[3] isEqualTo:usersSymbol])
                                 || ([boxes[2] isEqualTo:usersSymbol] && [boxes[4] isEqualTo:usersSymbol]))
                            number = 6;
                        else if (([boxes[6] isEqualTo:usersSymbol] && [boxes[8] isEqualTo:usersSymbol])
                                 || ([boxes[1] isEqualTo:usersSymbol] && [boxes[4] isEqualTo:usersSymbol]))
                            number = 7;
                        else if (([boxes[6] isEqualTo:usersSymbol] && [boxes[7] isEqualTo:usersSymbol])
                                 || ([boxes[0] isEqualTo:usersSymbol] && [boxes[4] isEqualTo:usersSymbol])
                                 || ([boxes[2] isEqualTo:usersSymbol] && [boxes[5] isEqualTo:usersSymbol]))
                            number = 8;
                        
                        
                        //conditions to win computer
                        else if (([boxes[1] isEqualTo:_oXchoice] && [boxes[2] isEqualTo:_oXchoice])
                                 || ([boxes[4] isEqualTo:_oXchoice] && [boxes[8] isEqualTo:_oXchoice])
                                 || ([boxes[3] isEqualTo:_oXchoice] && [boxes[6] isEqualTo:_oXchoice]))
                            number = 0;
                        else if (([boxes[0] isEqualTo:_oXchoice] && [boxes[2] isEqualTo:_oXchoice])
                                 || ([boxes[4] isEqualTo:_oXchoice] && [boxes[7] isEqualTo:_oXchoice])
                                 )
                            number = 1;
                        else if (([boxes[0] isEqualTo:_oXchoice] && [boxes[1] isEqualTo:_oXchoice])
                                 || ([boxes[4] isEqualTo:_oXchoice] && [boxes[6] isEqualTo:_oXchoice])
                                 || ([boxes[5] isEqualTo:_oXchoice] && [boxes[8] isEqualTo:_oXchoice]))
                            number = 2;
                        else if (([boxes[4] isEqualTo:_oXchoice] && [boxes[5] isEqualTo:_oXchoice])
                                 || ([boxes[0] isEqualTo:_oXchoice] && [boxes[6] isEqualTo:_oXchoice]))
                            number = 3;
                        else if (([boxes[3] isEqualTo:_oXchoice] && [boxes[5] isEqualTo:_oXchoice])
                                 || ([boxes[1] isEqualTo:_oXchoice] && [boxes[7] isEqualTo:_oXchoice])
                                 || ([boxes[0] isEqualTo:_oXchoice] && [boxes[8] isEqualTo:_oXchoice])
                                 || ([boxes[2] isEqualTo:_oXchoice] && [boxes[6] isEqualTo:_oXchoice]))
                            number = 4;
                        else if (([boxes[3] isEqualTo:_oXchoice] && [boxes[4] isEqualTo:_oXchoice])
                                 || ([boxes[2] isEqualTo:_oXchoice] && [boxes[8] isEqualTo:_oXchoice]))
                            number = 5;
                        else if (([boxes[7] isEqualTo:_oXchoice] && [boxes[8] isEqualTo:_oXchoice])
                                 || ([boxes[0] isEqualTo:_oXchoice] && [boxes[3] isEqualTo:_oXchoice]))
                            number = 6;
                        else if (([boxes[6] isEqualTo:_oXchoice] && [boxes[8] isEqualTo:_oXchoice])
                                 || ([boxes[1] isEqualTo:_oXchoice] && [boxes[4] isEqualTo:_oXchoice]))
                            number = 7;
                        else if (([boxes[6] isEqualTo:_oXchoice] && [boxes[7] isEqualTo:_oXchoice])
                                 || ([boxes[0] isEqualTo:_oXchoice] && [boxes[4] isEqualTo:_oXchoice])
                                 || ([boxes[2] isEqualTo:_oXchoice] && [boxes[5] isEqualTo:_oXchoice]))
                            number = 8;
                        else  number = 1 + arc4random_uniform(*_boardSize);
                        
                        if ([boxes[number-1] isNotEqualTo:@" "])
                            continue;
                        
                        else break;
                    }
                }
                else {
                    
                    printf("\nEnter a number \n");
                    scanf("%d", &number);
                    fpurge(stdin);
                    
                    if ((number <1) || (number > (*_boardSize + 1) )) {
                        printf("\nWrong choice! ");
                        continue;
                    }
                }
                
                /* variable for storing offset (better to fix it once here than possibly 100 other palces later )
                 check for empty boxes before entering user selected option if box is NOT "empty" tell user to slect a different box */
                adjInputForOffset = number-1;
                if ([boxes[adjInputForOffset] isNotEqualTo:@" "]){
                    printf("\nPlease choose another box \n");
                    //  transpose x's and o's
                    if ([_oXchoice isEqualToString:@"x"]){
                        _oXchoice = @"o";
                    }
                    else {
                        _oXchoice = @"x";
                    }
                }
                
                //if box is empty enter user selection
                else if ([boxes[adjInputForOffset] isEqualTo:@" "]){
                    boxes[adjInputForOffset] = _oXchoice;
                }
                
                
                if (computer == YES) {
                    computer = NO;
                }
                else{
                    computer = YES;
                }
                
                //  transpose x's and o's
                if ([_oXchoice isEqualToString:@"x"]){
                    _oXchoice = @"o";
                }
                else {
                    _oXchoice = @"x";
                }
                
                [self printBoard:_gridSize];
                
                
                wonTheGame = [self winner:_gridSize];
                
                
                if (!wonTheGame)
                    
                    continue;
                else
                    break;
                
            } // end of while loop
            if (!wonTheGame)
                
                continue;
            else
                break;
        } // end of        for (int i =0; i<*_boardSize; i++){
        
    } // end of     if (_singleOrMultiMode = 2 && _gameLevel == 1 )
    
    
    
    
    
    
    
    // multiple Player
    
    if ([_singleOrMultiMode  isEqual: @"2"]  ) {
        
        for (int i =0; i<*_boardSize; i++){
            
            //run game until all boxes are filled up
            while ([boxes[i] isEqualTo:@" "]) {
                printf("\nEnter a number \n");
                scanf("%d", &number);
                fpurge(stdin);
                
                if ((number <1) || (number > (*_boardSize + 1) )) {
                    printf("\nWrong choice! ");
                    continue;
                }
                
                
                /* variable for storing offset (better to fix it once here than possibly 100 other palces later )
                 check for empty boxes before entering user selected option if box is NOT "empty" tell user to slect a different box */
                
                adjInputForOffset = number-1;
                if ([boxes[adjInputForOffset] isNotEqualTo:@" "]){
                    printf("\nPlease choose another box\n");
                    //  transpose x's and o's
                    
                    
                    if ([_gameLevel  isEqual: @"1"] && [_oXchoice isEqualToString:@"x"]){
                        _oXchoice = @"o";
                    }
                    else {
                        _oXchoice = @"x";
                    }
                    
                }
                
                //if box is empty enter user selection
                else if ([boxes[adjInputForOffset] isEqualTo:@" "]){
                    boxes[adjInputForOffset] = _oXchoice;
                }
                
                //  transpose x's and o's
                if ([_oXchoice isEqualToString:@"x"]){
                    _oXchoice = @"o";
                }
                else {
                    _oXchoice = @"x";
                }
                [self printBoard:_gridSize];
                
                wonTheGame = [self winner:_gridSize];
                
                
                if (!wonTheGame)
                    
                    continue;
                else
                    break;
                
                
                
                
                
            } // end of while loop
            if (!wonTheGame)
                
                continue;
            else
                break;
        } // end of        for (int i =0; i<*_boardSize; i++){
        
    } // end of     if (_singleOrMultiMode = 2 && _gameLevel == 1 )
    
    
    
} // end of void











-(BOOL) winner: (NSString *) gridSize {
    NSString *i = @"x";
    NSString *j = @"o";
    NSString *theWinner;
    _gridSize = gridSize;
    
    if ((([_gridSize  isEqual: @"1"])  &&
         (([boxes[0] isEqualToString: i] && [boxes [1] isEqualToString: i] && [boxes [2] isEqualToString: i])
          || ([boxes[3] isEqualToString: i] && [boxes [4] isEqualToString: i] && [boxes [5] isEqualToString: i])
          || ([boxes[6] isEqualToString: i] && [boxes [7] isEqualToString: i] && [boxes [8] isEqualToString: i])
          || ([boxes[0] isEqualToString: i] && [boxes [3] isEqualToString: i] && [boxes [6] isEqualToString: i])
          || ([boxes[1] isEqualToString: i] && [boxes [4] isEqualToString: i] && [boxes [7] isEqualToString: i])
          || ([boxes[2] isEqualToString: i] && [boxes [5] isEqualToString: i] && [boxes [8] isEqualToString: i])
          || ([boxes[0] isEqualToString: i] && [boxes [4] isEqualToString: i] && [boxes [8] isEqualToString: i])
          || ([boxes[2] isEqualToString: i] && [boxes [4] isEqualToString: i] && [boxes [6] isEqualToString: i])))) {
             
             theWinner = i;
             
             NSLog (@"* * * *  %@  * * * *", theWinner);
             usleep(100000);
             printf("W ");
             usleep(100000);
             printf("O ");
             
             usleep(100000);
             printf("N   ");
             
             usleep(100000);
             printf("T ");
             
             usleep(100000);
             printf("H ");
             
             usleep(100000);
             printf("I ");
             
             usleep(100000);
             printf("S    ");
             
             usleep(100000);
             printf("R ");
             
             usleep(100000);
             printf("O ");
             
             usleep(100000);
             printf("U ");
             
             usleep(100000);
             printf("N ");
             
             usleep(100000);
             printf("D ");
             
             usleep(100000);
             printf(" ! !");
             
             
             
             return YES;
         }
    
    else if (
             (
              ([_gridSize  isEqual: @"1"])  &&
              (
               ([boxes[0] isEqualToString: j] && [boxes [1] isEqualToString: j] && [boxes [2] isEqualToString: j])
               || ([boxes[3] isEqualToString: j] && [boxes [4] isEqualToString: j] && [boxes [5] isEqualToString: j])
               || ([boxes[6] isEqualToString: j] && [boxes [7] isEqualToString: j] && [boxes [8] isEqualToString: j])
               || ([boxes[0] isEqualToString: j] && [boxes [3] isEqualToString: j] && [boxes [6] isEqualToString: j])
               || ([boxes[1] isEqualToString: j] && [boxes [4] isEqualToString: j] && [boxes [7] isEqualToString: j])
               || ([boxes[2] isEqualToString: j] && [boxes [5] isEqualToString: j] && [boxes [8] isEqualToString: j])
               || ([boxes[0] isEqualToString: j] && [boxes [4] isEqualToString: j] && [boxes [8] isEqualToString: j])
               || ([boxes[2] isEqualToString: j] && [boxes [4] isEqualToString: j] && [boxes [6] isEqualToString: j])
               )
              )
             ) {
        
        theWinner = j;
        
        NSLog (@"* * * *  %@  * * * *", theWinner);
        usleep(100000);
        printf("W ");
        usleep(100000);
        printf("O ");
        
        usleep(100000);
        printf("N   ");
        
        usleep(100000);
        printf("T ");
        
        usleep(100000);
        printf("H ");
        
        usleep(100000);
        printf("I ");
        
        usleep(100000);
        printf("S    ");
        
        usleep(100000);
        printf("R ");
        
        usleep(100000);
        printf("O ");
        
        usleep(100000);
        printf("U ");
        
        usleep(100000);
        printf("N ");
        
        usleep(100000);
        printf("D ");
        
        usleep(100000);
        printf(" ! !");
        
        return YES;
    }
    
    else if (
             (
              ([_gridSize  isEqual: @"2"]) &&
              (
               ([boxes[0] isEqualToString: i] && [boxes [1] isEqualToString: i] && [boxes [2] isEqualToString: i] && [boxes[3] isEqualToString: i])
               ||
               ([boxes[4] isEqualToString: i] && [boxes [5] isEqualToString: i] && [boxes [6] isEqualToString: i] && [boxes[7] isEqualToString: i])
               ||
               ([boxes[8] isEqualToString: i] && [boxes [9] isEqualToString: i] && [boxes [10] isEqualToString: i] && [boxes[11] isEqualToString: i])
               ||
               ([boxes[12] isEqualToString: i] && [boxes [13] isEqualToString: i] && [boxes [16] isEqualToString: i] && [boxes[15] isEqualToString: i])
               ||
               ([boxes[0] isEqualToString: i] && [boxes [4] isEqualToString: i] && [boxes [8] isEqualToString: i] && [boxes[12] isEqualToString: i])
               ||
               ([boxes[1] isEqualToString: i] && [boxes [5] isEqualToString: i] && [boxes [9] isEqualToString: i] && [boxes[13] isEqualToString: i])
               ||
               ([boxes[2] isEqualToString: i] && [boxes [6] isEqualToString: i] && [boxes [10] isEqualToString: i] && [boxes[14] isEqualToString: i])
               ||
               ([boxes[3] isEqualToString: i] && [boxes [7] isEqualToString: i] && [boxes [11] isEqualToString: i] && [boxes[15] isEqualToString: i])
               ||
               ([boxes[0] isEqualToString: i] && [boxes [5] isEqualToString: i] && [boxes [10] isEqualToString: i] && [boxes[15] isEqualToString: i])
               ||
               ([boxes[3] isEqualToString: i] && [boxes [6] isEqualToString: i] && [boxes [9] isEqualToString: i] && [boxes[12] isEqualToString: i])
               )
              )
             ) {
        
        theWinner = i;
        
        NSLog (@"* * * *  %@  * * * *", theWinner);
        usleep(100000);
        printf("W ");
        usleep(100000);
        printf("O ");
        
        usleep(100000);
        printf("N   ");
        
        usleep(100000);
        printf("T ");
        
        usleep(100000);
        printf("H ");
        
        usleep(100000);
        printf("I ");
        
        usleep(100000);
        printf("S    ");
        
        usleep(100000);
        printf("R ");
        
        usleep(100000);
        printf("O ");
        
        usleep(100000);
        printf("U ");
        
        usleep(100000);
        printf("N ");
        
        usleep(100000);
        printf("D ");
        
        usleep(100000);
        printf(" ! !");
        
        return YES;
    }
    
    else if (
             (
              ([_gridSize  isEqual: @"2"]) &&
              (
               ([boxes[0] isEqualToString: j] && [boxes [1] isEqualToString: j] && [boxes [2] isEqualToString: j] && [boxes[3] isEqualToString: j])
               ||
               ([boxes[4] isEqualToString: j] && [boxes [5] isEqualToString: j] && [boxes [6] isEqualToString: j] && [boxes[7] isEqualToString: j])
               ||
               ([boxes[8] isEqualToString: j] && [boxes [9] isEqualToString: j] && [boxes [10] isEqualToString: j] && [boxes[11] isEqualToString: j])
               ||
               ([boxes[12] isEqualToString: j] && [boxes [13] isEqualToString: j] && [boxes [16] isEqualToString: j] && [boxes[15] isEqualToString: j])
               ||
               ([boxes[0] isEqualToString: j] && [boxes [4] isEqualToString: j] && [boxes [8] isEqualToString: j] && [boxes[12] isEqualToString: j])
               ||
               ([boxes[1] isEqualToString: j] && [boxes [5] isEqualToString: j] && [boxes [9] isEqualToString: j] && [boxes[13] isEqualToString: j])
               ||
               ([boxes[2] isEqualToString: j] && [boxes [6] isEqualToString: j] && [boxes [10] isEqualToString: j] && [boxes[14] isEqualToString: j])
               ||
               ([boxes[3] isEqualToString: j] && [boxes [7] isEqualToString: j] && [boxes [11] isEqualToString: j] && [boxes[15] isEqualToString: j])
               ||
               ([boxes[0] isEqualToString: j] && [boxes [5] isEqualToString: j] && [boxes [10] isEqualToString: j] && [boxes[15] isEqualToString: j])
               ||
               ([boxes[3] isEqualToString: j] && [boxes [6] isEqualToString: j] && [boxes [9] isEqualToString: j] && [boxes[12] isEqualToString: j])
               )
              )
             ) {
        
        theWinner = j;
        
        NSLog (@"* * * *  %@  * * * *", theWinner);
        usleep(100000);
        printf("W ");
        usleep(100000);
        printf("O ");
        
        usleep(100000);
        printf("N   ");
        
        usleep(100000);
        printf("T ");
        
        usleep(100000);
        printf("H ");
        
        usleep(100000);
        printf("I ");
        
        usleep(100000);
        printf("S    ");
        
        usleep(100000);
        printf("R ");
        
        usleep(100000);
        printf("O ");
        
        usleep(100000);
        printf("U ");
        
        usleep(100000);
        printf("N ");
        
        usleep(100000);
        printf("D ");
        
        usleep(100000);
        printf(" ! !");
        
        return YES;
    }
    else
        
        return NO;
} //end of BOOL


@end














int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        BOOL playingAgainRepeat = YES;
        
        while (playingAgainRepeat) {
            
            // create a new object
            TicTacToe* tictac = [[TicTacToe alloc]init];
            
            //declare variable for use holding x and o
            char oXchoice[2];
            char singleOrMultiMode[0];
            char gridSize[0];
            char gameLevel[0];
            NSString * ns_oXchoice ;
            NSString * ns_singleOrMultiMode ;
            NSString * ns_gridSize;
            NSString * ns_gameLevel;
            
            
            while (true) {
                
                printf("Choose x or o: \n");
                scanf("%s", oXchoice);
                fpurge(stdin);
                
                // convert oXchoice to nsstring
                ns_oXchoice= [NSString stringWithCString: oXchoice encoding: NSASCIIStringEncoding];
                
                //check nsConversion for good input x/o, reject everything else
                if ([ns_oXchoice length] == 1 && ([ns_oXchoice isEqualToString:@"x"] || [ns_oXchoice isEqualToString:@"X"] || [ns_oXchoice isEqualToString:@"o"] || [ns_oXchoice isEqualToString:@"O"])) {
                    break;
                }
                else  {
              
                    printf("\nWrong choice! ");
                    continue;
                } //end nsConversion filter check
                
            } //end of while loop
            
            
            /*----------------------------------------------------------------------------------------------*/
            
            
            //ask user for board size
            while (true) {
                printf("\nChoose board size:\n 1:: Play On 3x3 Grid \n 2:: Play On 4x4 grid \n 3:: Mega ttt\n");
                scanf("%s", gridSize);
                fpurge(stdin);
                
                // convert gridSize to nsstring
                ns_gridSize= [NSString stringWithCString: gridSize encoding: NSASCIIStringEncoding];
                if ([ns_gridSize length] == 1 && ([ns_gridSize isEqualToString:@"1"] || [ns_gridSize isEqualToString:@"2"] || [ns_gridSize isEqualToString:@"3"]))
                    break;
                else {
                    printf("\nWrong choice! ");
                    continue;
                }
            }//end of while loop
            
            
            
            //ask user for single or multiplayer mode
            while (true) {
                printf("\nChoose playerMode: \n 1:: Player Vs CPU \n 2:: Player Vs Player \n");
                scanf("%s", singleOrMultiMode);
                fpurge(stdin);
                
                ns_singleOrMultiMode= [NSString stringWithCString: singleOrMultiMode encoding: NSASCIIStringEncoding];
                
                
                if ([ns_singleOrMultiMode length] == 1 && ([ns_singleOrMultiMode isEqualToString:@"1"] || [ns_singleOrMultiMode isEqualToString:@"2"]))
                    
                    break;
                else {
                    printf("\nWrong choice! ");
                    continue;
                }
            } //end of while loop
            
            while ([ns_singleOrMultiMode  isEqual: @"1"]) {
                // ask use for game level {
                printf(" \n 1:: Level 1: Computer is totally dumb.");
                printf(" \n 2:: Level 2: Computer is smarter.\n");
                scanf ("%s", gameLevel);
                fpurge(stdin);
                
                // convert gameLevel to nsstring
                ns_gameLevel= [NSString stringWithCString: gameLevel encoding: NSASCIIStringEncoding];
                
                if ([ns_gameLevel length] == 1 && ([ns_gameLevel isEqualToString:@"1"] || [ns_gameLevel isEqualToString:@"2"]))
                    break;
                
                else {
                    printf("\nWrong choice! ");
                    continue;
                }  // end of if
            } //end of while loop
            
            
            while ([ns_singleOrMultiMode  isEqual: @"2"]) {
                printf("\n 1:: Level 1: Easy level");
                printf("\n 2:: Level 2: Loose your turn if you pick up an occupied box\n");
                
                scanf ("%s", gameLevel);
                fpurge(stdin);
                
                // convert gameLevel to nsstring
                ns_gameLevel= [NSString stringWithCString: gameLevel encoding: NSASCIIStringEncoding];
                
                if (([ns_gameLevel isEqualToString:@"1"]) || ([ns_gameLevel isEqualToString:@"2"])) {
                    break;
                }
                else {
                    printf("\nWrong choice! ");
                    continue;;
                }  // end of if
                
            } //end of while loop
            
            
            if([ns_gridSize isEqual: @"1"]){
                //display grid numbers for users and instructions for selecting a box on the grid
                printf("\nYou have selected the 3x3 grid, good luck.  To select a box on the grid please select its corresponding number on your keyboard\n");
                NSLog (@" 1 | 2 | 3");
                NSLog (@"-----------");
                NSLog (@" 4 | 5 | 6");
                NSLog (@"-----------");
                NSLog (@" 7 | 8 | 9");
                NSLog (@"\n");
            }
            
            else if([ns_gridSize isEqual: @"2"]){
                //display grid numbers for users and instructions for selecting a box on the grid
                printf("\nYou have selected the 4x4 grid LoL!! GOOD LUCK.  To select a box on the grid please select its corresponding number on your keyboard\n");
                NSLog (@" 1  |  2  | 3  |  4");
                NSLog (@"-------------------");
                NSLog (@" 5  |  6  | 7  | 8");
                NSLog (@"--------------------");
                NSLog (@" 9  | 10  | 11 | 12 ");
                NSLog (@"--------------------");
                NSLog (@" 13 | 14  | 15 | 16 ");
                NSLog (@"\n");
                
            }
            
            else if([ns_gridSize isEqual: @"3"]){
                //display grid numbers for users and instructions for selecting a box on the grid
                printf("\nYou have selected the Mega grid, good luck.  To select a box on the grid please select its corresponding number on your keyboard\n");
                NSLog (@" 1 | 2 | 3    |  1 | Z | 3      |  1 | 2 | 3  ");
                
                NSLog (@"-----------   |  -----------    | ------------");
                
                NSLog (@" 4 | 5 | 6    |  4 | 5 | 6      |  4 | 5 | 6  ");
                
                NSLog (@"-----------   |  -----------    | ------------");
                
                NSLog (@" 7 | 8 | 9    |  7 | 8 | 9      |  7 | 8 | 9  ");
                
                NSLog (@"----------------------------------------------");
                
                NSLog (@" 1 | 2 | 3    |  1 | 2 | 3      |  1 | 2 | 3  ");
                
                NSLog (@"-----------   |  -----------    | ------------");
                
                NSLog (@" 4 | 5 | 6    |  4 | 5 | 6      |  4 | 5 | 6  ");
                
                NSLog (@"-----------   |  ------------   | ------------");
                
                NSLog (@" 7 | 8 | 9    |  7 | 8 | 9      |  7 | 8 | 9  ");
                
                NSLog (@"----------------------------------------------");
                
                NSLog (@" 1 | 2 | 3    |  1 | 2 | 3      |  1 | 2 | 3  ");
                
                NSLog (@"-----------   |  -----------    | ------------");
                
                NSLog (@" 4 | 5 | 6    |  4 | 5 | 6      |  4 | 5 | 6  ");
                
                NSLog (@"-----------   |  -----------    | ------------");
                
                NSLog (@" 7 | 8 | 9    |  7 | 8 | 9      |  7 | 8 | 9  ");
                
                NSLog (@"----------------------------------------------");             }
            
            
            
            //create and initialize mutableArray
            int boardSize;
            //let this value come from gameSize [ 1 = 8 [3x3 grid] / 2 = 15 [4x4 grid] / 3 = [5x5 grid]
            if ([ns_gridSize isEqual: @"1"]){
                boardSize = 8; //because counting starts from 0
            }
            else if ([ns_gridSize isEqual: @"2"]){
                boardSize = 15;
                
            }
            else if ([ns_gridSize isEqual: @"3"]){
                boardSize = 24;
                
            }
            
            
            
            // initialize array
            [tictac initializeArray:boardSize];
            
            [tictac first:ns_singleOrMultiMode second:ns_gameLevel third:ns_oXchoice fourth:ns_gridSize fifth:&boardSize];
            
            
            
            //repeat the game if user wants to play again
            while (true) {
                char playAgain[0];
                NSString * ns_playAgain;
                printf("\nStart another game? \n1: YES \n2: NO\n");
                fpurge(stdin);
                scanf("%s", playAgain);
                
                // convert playAgain to nsstring
                ns_playAgain = [NSString stringWithCString: playAgain encoding: NSASCIIStringEncoding];
                
                if ([ns_playAgain isEqualToString:@"2"]) {
                    playingAgainRepeat = NO;
                    printf("\nThank you for playing!! ");
                    break;
                }
                else if ([ns_playAgain isEqualToString:@"1"]) {
                    playingAgainRepeat = YES;
                    break;
                }
                else{
                    printf("\nWrong choice! ");
                    continue;
                }
                
            } //end of while loop
            
        } // end of playingAgainRepeat
    }
    
    return 0;
}

