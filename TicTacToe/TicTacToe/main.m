////
////  main.m
////  TicTacToe
////
////  Created by Michael Kavouras on 6/25/15.
////  Copyright (c) 2015 Mike Kavouras. All rights reserved.
////
//#import <Foundation/Foundation.h>
//
//
//
//@interface TicTacToe : NSObject
//
//-(void) setName: (NSString *)name;
//-(NSString *)name;
//
//-(void) setOxChoice: (NSString *)oxChoice;
//-(NSString *)oxChoice;
//
//
//@end
//
//
//@implementation TicTacToe
//NSString *_name;
//NSString *_oxChoice;
//
//-(void) setName: (NSString *)name{
//    _name = name;
//}
//
//-(NSString *) name {
//    return _name;
//}
//
//
//
//-(void) setOxChoice: (NSString *)oxChoice{
//    _oxChoice = oxChoice;
//    
//    NSMutableArray *_board = [NSMutableArray arrayWithCapacity:9];
//    for (int i=0; i<9; i++) {
//        _board[i] = @" ";
//    }
//    NSLog (@" %@ | %@ | %@ ", _board[0],_board[1],_board[2]);
//    NSLog (@"-----------");
//    NSLog (@" %@ | %@ | %@ ", _board[3],_board[4],_board[5]);
//    NSLog (@"-----------");
//    NSLog (@" %@ | %@ | %@ ", _board[6],_board[7],_board[8]);
//    
//    BOOL winnerIsX = NO;
//    BOOL winnerIsO = NO;
//    //user number input
//    int number;
//    
//    //
//    for (int i =0; i<9; i++){
//        //while there is still an empty box
//        while ([_board[i] isEqualTo:@" "]) {
//            
//            printf ("Enter a number ");
//            scanf("%d", &number);
//            
//            
//            
//            
//            if (number == 1){
//                //chech if the box is empty
//                if ([_board[0] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                }
//                else _board[0]= oxChoice ;
//            }
//            else if (number == 2) {
//                if ([_board[1] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else _board[1]= oxChoice;
//            }
//            else if (number == 3) {
//                if ([_board[2] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else  _board[2]= oxChoice ;
//            }
//            else if (number == 4){
//                if ([_board[3] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else _board[3]= oxChoice ;
//            }
//            else if (number == 5){
//                if ([_board[4] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else _board[4]= oxChoice ;
//            }
//            else if (number == 6){
//                if ([_board[5] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else _board[5]= oxChoice ;
//            }
//            else if (number == 7){
//                if ([_board[6] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else _board[6]= oxChoice ;
//            }
//            else if (number == 8){
//                if ([_board[7] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else _board[7]= oxChoice ;
//            }
//            else if (number == 9){
//                if ([_board[8] isNotEqualTo:@" "]){
//                    NSLog(@"please choose another box");
//                } else _board[8]= oxChoice ;
//            }
//            
//            if ((([_board[0] isEqualToString: @"x"]) && ([_board [1] isEqualToString: @"x"]) && ([_board [2] isEqualToString: @"x"])) ||
//                (([_board[3] isEqualToString: @"x"]) && ([_board [4] isEqualToString: @"x"]) && ([_board [5] isEqualToString: @"x"])) ||
//                (([_board[6] isEqualToString: @"x"]) && ([_board [7] isEqualToString: @"x"]) && ([_board [8] isEqualToString: @"x"])) ||
//                (([_board[0] isEqualToString: @"x"]) && ([_board [3] isEqualToString: @"x"]) && ([_board [6] isEqualToString: @"x"])) ||
//                (([_board[1] isEqualToString: @"x"]) && ([_board [4] isEqualToString: @"x"]) && ([_board [7] isEqualToString: @"x"])) ||
//                (([_board[2] isEqualToString: @"x"]) && ([_board [5] isEqualToString: @"x"]) && ([_board [8] isEqualToString: @"x"])) ||
//                (([_board[0] isEqualToString: @"x"]) && ([_board [4] isEqualToString: @"x"]) && ([_board [8] isEqualToString: @"x"])) ||
//                (([_board[2] isEqualToString: @"x"]) && ([_board [4] isEqualToString: @"x"]) && ([_board [6] isEqualToString: @"x"])))
//                winnerIsX = YES;
//            
//            else if ((([_board[0] isEqualToString: @"o"]) && ([_board [1] isEqualToString: @"o"]) && ([_board [2] isEqualToString: @"o"])) ||
//                     (([_board[3] isEqualToString: @"o"]) && ([_board [4] isEqualToString: @"o"]) && ([_board [5] isEqualToString: @"o"])) ||
//                     (([_board[6] isEqualToString: @"o"]) && ([_board [7] isEqualToString: @"o"]) && ([_board [8] isEqualToString: @"o"])) ||
//                     (([_board[0] isEqualToString: @"o"]) && ([_board [3] isEqualToString: @"o"]) && ([_board [6] isEqualToString: @"o"])) ||
//                     (([_board[1] isEqualToString: @"o"]) && ([_board [4] isEqualToString: @"o"]) && ([_board [7] isEqualToString: @"o"])) ||
//                     (([_board[2] isEqualToString: @"o"]) && ([_board [5] isEqualToString: @"o"]) && ([_board [8] isEqualToString: @"o"])) ||
//                     (([_board[0] isEqualToString: @"o"]) && ([_board [4] isEqualToString: @"o"]) && ([_board [8] isEqualToString: @"o"])) ||
//                     (([_board[2] isEqualToString: @"o"]) && ([_board [4] isEqualToString: @"o"]) && ([_board [6] isEqualToString: @"o"])))
//                winnerIsO = YES;
//
//            NSLog (@" %@ | %@ | %@ ", _board[0],_board[1],_board[2]);
//            NSLog (@"-----------");
//            NSLog (@" %@ | %@ | %@ ", _board[3],_board[4],_board[5]);
//            NSLog (@"-----------");
//            NSLog (@" %@ | %@ | %@ ", _board[6],_board[7],_board[8]);
//            NSLog (@"\n\n\n\n");
//            
//            
//            if ([oxChoice isEqualToString:@"x"])
//                oxChoice = @"o";
//            else
//                (oxChoice = @"x");
//            
//            if (winnerIsX) {
//                printf("Winner is X");
//                break; }
//            else if (winnerIsO) {
//                printf("Winner is O");
//                break; }
//        } //end of while
//        if (winnerIsX) {
//            break; }
//        else if (winnerIsO) {
//            break; }
//        
//    } //end of for
//    
//    
//} //end of the function
//-(NSString *) oxChoice {
//    return _oxChoice;
//}
//@end
//
//
//
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        int singleOrMultiplayer;
//        int singlePlayerLevel, multiplePlayerLevel;
//        char player1Name[30], player2Name[30];
//        NSString *nsConversion ;
//        
//        
//        while (true) {
//            NSLog (@"1. Single player");
//            NSLog (@"2. Multiple players");
//            scanf("%d", &singleOrMultiplayer);
//            fpurge(stdin);
//            
//            
//            if (singleOrMultiplayer == 1) {
//                NSLog (@"1. Level 1: Computer is totally dumb.");
//                NSLog (@"2. Level 2: Computer is smarter.");
//                NSLog (@"3. Level 3: You MAY win (only when you start).");
//                NSLog (@"4. Level 4: Computer NEVER loses.");
//                scanf ("%d", &singlePlayerLevel);
//                break;
//            }
//            else if (singleOrMultiplayer == 2) {
//                NSLog (@"1. Level 1: Easy level");
//                NSLog (@"2. Level 2: Loose your turn if you pick up an occupied box");
//                scanf ("%d", &multiplePlayerLevel);
//                break;
//            }
//            else if ((singleOrMultiplayer != 1) || (singleOrMultiplayer != 2)) {
//                NSLog (@"Wrong choice! ");
//                continue;
//            }
//            
//        } //end of while
//        
//        
//        if (singleOrMultiplayer == 1) {
//            NSLog(@"Player 1 Name:  ");
//            scanf ("%s", player1Name);
//            fpurge(stdin);
//
//            if (singlePlayerLevel == 1) {
//                
//            } //end of if (singlePlayerLevel == 1)
//            else if (singlePlayerLevel == 2) {
//                
//            } //end of if (singlePlayerLevel == 2)
//            
//            else if (singlePlayerLevel == 3) {
//                
//            } //end of if (singlePlayerLevel == 3)
//            
//            else if (singlePlayerLevel == 2) {
//                
//            } //end of if (singlePlayerLevel == 3)
//            
//            else if (singlePlayerLevel == 4) {
//                
//            } //end of if (singlePlayerLevel == 4)
//            
//            
//            
//        } // end of if (singleOrMultiplayer == 1)
//        
//        
//        else if (singleOrMultiplayer == 2) {
//            NSLog(@"Player 1 Name:  ");
//            scanf ("%s", player1Name);
//            NSLog(@"Player 2 Name:  ");
//            scanf ("%s", player2Name);
//            fpurge(stdin);
//
//            
//            if (multiplePlayerLevel == 1) {
//                // play the game without loosing your turn
//            } //end of if (multiplePlayerLevel == 1)
//            
//            else if (multiplePlayerLevel == 2) {
//                // play the game and loose your turn
//            } // end of if (multiplePlayerLevel == 2)
//            
//            
//            
//        } // end of if (singleOrMultiplayer == 2)
//        
//        
//        
//        NSLog (@" 1 | 2 | 3");
//        NSLog (@"-----------");
//        NSLog (@" 4 | 5 | 6");
//        NSLog (@"-----------");
//        NSLog (@" 7 | 8 | 9");
//        NSLog (@"\n");
//        
//        
//        char * userOption;
//        
//        while (true) {
//            
//            NSLog(@"Choose X or O: ");
//            scanf("%s", userOption);
//            fpurge(stdin);
//            
//            // create nsstring
//            nsConversion = [NSString stringWithCString: userOption encoding: NSASCIIStringEncoding];
//
//            
//            // [nsConversion length]
//            if ([nsConversion length] == 1 && ([nsConversion isEqualToString:@"x"] || [nsConversion isEqualToString:@"0"])) {
//                NSLog(@"This is your choice: %@",nsConversion);
//                break;
//            } // end of if
//            else  {
//                NSLog (@"Wrong choice! ");
//                continue;
//            } //end of else
//            
//        } // end of while
//        
//        
//        TicTacToe *user1 = [[TicTacToe alloc] init];
//        
//        [user1 setOxChoice:nsConversion];
//        
//    }
//    return 0;
//}



//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.

#import <Foundation/Foundation.h>


@interface TicTacToe : NSObject




-(void) setGameLevel: (int  *)gameLevel;
-(int *)gameLevel;

//-(void) setUserMode: (int *)userMode, (int *)gameLevel;
-(int *)userMode;

-(void) initializeArray: (int) dimension;
-(void) printBoard;
-(BOOL) isPositionValid;
-(BOOL) isWinner;
-(BOOL) isFull;

@end


@implementation TicTacToe {

int *_gameLevel;
int *_userMode;
int *_gridSize;
int *_chooseABox;
NSString *_xOrO;
NSMutableArray *_board;
//BOOL _winnerIsX == NO;
//BOOL _winnerIsO == NO;
}



-(void) initializeArray: (int) gridSize{
    _gridSize = &gridSize;
    _board = [[NSMutableArray alloc] init];
    
    _board = [NSMutableArray arrayWithCapacity:_gridSize];
    for (int i=0; i<gridSize; i++) {
        _board[i] = @" ";
    }
}

-(void) setGameLevel:(int *)gameLevel{
    _gameLevel = gameLevel;
}


-(int *) gameLevel {
    return _gameLevel;
}



-(void) setUserMode: (int *)userMode {
    _userMode = userMode;
}
-(int *) userMode {
    return _userMode;
}
    
-(void) startPlaying: (NSString *)xOrO {
    _xOrO = xOrO;
    
    if (_userMode == 2 && _gameLevel == 1) {
        
        //get a number a number from user [1-9] to choose a single grid box
        for (int i =0; i<_gridSize; i++){
            
            //run game until all _board are filled up
            while ([_board[i] isEqualTo:@" "]) {
                NSLog(@"Enter a number ");
                scanf("%d", &_chooseABox);
                fpurge(stdin);
                
                int adjInputForOffset = *(_chooseABox-1);
                
                //check for empty _board before entering user selected options
                if ([_board[adjInputForOffset] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                    
                    //change symbol
                    if ([_xOrO isEqualToString:@"x"]){
                        _xOrO = @"o";
                    }
                    else {
                        _xOrO = @"x";
                        
                    } //end of else
                }//end of if
                
                
                //if box is empty enter user selection
                else if ([_board[adjInputForOffset] isEqualTo:@" "]){
                    _board[adjInputForOffset] = _xOrO;
                }
                
                //change symbol after playing one round
                if ([_xOrO isEqualToString:@"x"]){
                    _xOrO = @"o";
                }
                else {
                    _xOrO = @"x";
                    
                
                    
                } //end of else
                
            } //end of while
        
        }//end of for
            
            
        }//end of if
        
        
    } // end of void
    


-(void) printBoard {
    
                NSLog (@" %@ | %@ | %@ ", _board[0],_board[1],_board[2]);
                NSLog (@"-----------");
                NSLog (@" %@ | %@ | %@ ", _board[3],_board[4],_board[5]);
                NSLog (@"-----------");
                NSLog (@" %@ | %@ | %@ ", _board[6],_board[7],_board[8]);
                NSLog (@"\n\n\n\n");
    
}
//-(BOOL) validSquare{
//
//}
-(BOOL) winner{
    NSString *i = @"x";
    NSString *j = @"o";
  //  NSString *theWinner;

    if (*_gridSize == 9) {
        if (([_board[0] isEqualToString: i] && [_board [1] isEqualToString: i] && [_board [2] isEqualToString: i]) ||
            ([_board[3] isEqualToString: i] && [_board [4] isEqualToString: i] && [_board [5] isEqualToString: i]) ||
            ([_board[6] isEqualToString: i] && [_board [7] isEqualToString: i] && [_board [8] isEqualToString: i]) ||
            ([_board[0] isEqualToString: i] && [_board [3] isEqualToString: i] && [_board [6] isEqualToString: i]) ||
            ([_board[1] isEqualToString: i] && [_board [4] isEqualToString: i] && [_board [7] isEqualToString: i]) ||
            ([_board[2] isEqualToString: i] && [_board [5] isEqualToString: i] && [_board [8] isEqualToString: i]) ||
            ([_board[0] isEqualToString: i] && [_board [4] isEqualToString: i] && [_board [8] isEqualToString: i]) ||
            ([_board[2] isEqualToString: i] && [_board [4] isEqualToString: i] && [_board [6] isEqualToString: i])) {
            
       //     theWinner = [_board objectAtIndex:0];

            NSLog(@"%@ won!", i);
            return YES;
        }
    
        else if (([_board[0] isEqualToString: j] && [_board [1] isEqualToString: j] && [_board [2] isEqualToString: j]) ||
                 ([_board[3] isEqualToString: j] && [_board [4] isEqualToString: j] && [_board [5] isEqualToString: j]) ||
                 ([_board[6] isEqualToString: j] && [_board [7] isEqualToString: j] && [_board [8] isEqualToString: j]) ||
                 ([_board[0] isEqualToString: j] && [_board [3] isEqualToString: j] && [_board [6] isEqualToString: j]) ||
                 ([_board[1] isEqualToString: j] && [_board [4] isEqualToString: j] && [_board [7] isEqualToString: j]) ||
                 ([_board[2] isEqualToString: j] && [_board [5] isEqualToString: j] && [_board [8] isEqualToString: j]) ||
                 ([_board[0] isEqualToString: j] && [_board [4] isEqualToString: j] && [_board [8] isEqualToString: j]) ||
                 ([_board[2] isEqualToString: j] && [_board [4] isEqualToString: j] && [_board [6] isEqualToString: j])) {
            NSLog(@"%@ won!", j);
            return YES;
        }
    } // end of if (_gridSize == 9) {
    
    else if (_gridSize == 16) {
        
        if (([_board[0] isEqualToString: i] && [_board [1] isEqualToString: i] && [_board [2] isEqualToString: i] && [_board[3] isEqualToString: i]) ||
            ([_board[4] isEqualToString: i] && [_board [5] isEqualToString: i] && [_board [6] isEqualToString: i] && [_board[7] isEqualToString: i]) ||
            ([_board[8] isEqualToString: i] && [_board [9] isEqualToString: i] && [_board [10] isEqualToString: i] && [_board[11] isEqualToString: i]) |
            ([_board[12] isEqualToString: i] && [_board [13] isEqualToString: i] && [_board [16] isEqualToString: i] && [_board[15] isEqualToString: i]) ||
            ([_board[0] isEqualToString: i] && [_board [4] isEqualToString: i] && [_board [8] isEqualToString: i] && [_board[12] isEqualToString: i]) ||
            ([_board[1] isEqualToString: i] && [_board [5] isEqualToString: i] && [_board [9] isEqualToString: i] && [_board[13] isEqualToString: i]) ||
            ([_board[2] isEqualToString: i] && [_board [6] isEqualToString: i] && [_board [10] isEqualToString: i] && [_board[14] isEqualToString: i]) ||
            ([_board[3] isEqualToString: i] && [_board [7] isEqualToString: i] && [_board [11] isEqualToString: i] && [_board[15] isEqualToString: i]) ||
            ([_board[0] isEqualToString: i] && [_board [5] isEqualToString: i] && [_board [10] isEqualToString: i] && [_board[15] isEqualToString: i]) ||
            ([_board[3] isEqualToString: i] && [_board [6] isEqualToString: i] && [_board [9] isEqualToString: i] && [_board[12] isEqualToString: i])) {
            NSLog(@"%@ won!", i);

            return YES;
        }
        
        else if (([_board[0] isEqualToString: j] && [_board [1] isEqualToString: j] && [_board [2] isEqualToString: j] && [_board[3] isEqualToString: j]) ||
                 ([_board[4] isEqualToString: j] && [_board [5] isEqualToString: j] && [_board [6] isEqualToString: j] && [_board[7] isEqualToString: j]) ||
                 ([_board[8] isEqualToString: j] && [_board [9] isEqualToString: j] && [_board [10] isEqualToString: j] && [_board[11] isEqualToString: j]) |
                 ([_board[12] isEqualToString: j] && [_board [13] isEqualToString: j] && [_board [16] isEqualToString: j] && [_board[15] isEqualToString: j]) ||
                 ([_board[0] isEqualToString: j] && [_board [4] isEqualToString: j] && [_board [8] isEqualToString: j] && [_board[12] isEqualToString: j]) ||
                 ([_board[1] isEqualToString: j] && [_board [5] isEqualToString: j] && [_board [9] isEqualToString: j] && [_board[13] isEqualToString: j]) ||
                 ([_board[2] isEqualToString: j] && [_board [6] isEqualToString: j] && [_board [10] isEqualToString: j] && [_board[14] isEqualToString: j]) ||
                 ([_board[3] isEqualToString: j] && [_board [7] isEqualToString: j] && [_board [11] isEqualToString: j] && [_board[15] isEqualToString: j]) ||
                 ([_board[0] isEqualToString: j] && [_board [5] isEqualToString: j] && [_board [10] isEqualToString: j] && [_board[15] isEqualToString: j]) ||
                 ([_board[3] isEqualToString: j] && [_board [6] isEqualToString: j] && [_board [9] isEqualToString: j] && [_board[12] isEqualToString: j])) {
            NSLog(@"%@ won!", j);

            return YES;
        }
        
    } //end of else if (_gridSize == 16) {
    
    
    
    //  return _winnerIsO;
    

//-(BOOL) isFull{
//
    return NO;
} //end of BOOL
@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int userSkill = 0;
        int playerMode = 0;
        int gridSizeSelected = 0, gridSize = 0;
        char player1Name[30], player2Name[30];
        NSString *userOptionXorO_string ;
        
        TicTacToe *newGame = [[TicTacToe alloc] init];

        while (true) {
            
            NSLog (@"Select grid:");
            NSLog (@"1. 3 X 3");
            NSLog (@"2. 4 X 4");
            NSLog (@"3. 5 X 5");
            scanf("%d", &gridSizeSelected);
            fpurge(stdin);
            
            if (gridSizeSelected == 1)
                gridSize = 9;
            else if (gridSizeSelected == 2)
                gridSize = 16;
            else if (gridSizeSelected == 3)
                gridSize = 25;
            else {
                NSLog (@"Wrong choice! ") ;
                continue;
            }
 
            NSLog (@"1. Single player");
            NSLog (@"2. Multiple players");
            scanf("%d", &playerMode);
            fpurge(stdin);
            
            
            if (playerMode == 1) {
                NSLog (@"1. Level 1: Computer is totally dumb.");
                NSLog (@"2. Level 2: Computer is smarter.");
                NSLog (@"3. Level 4: Computer NEVER loses.");
                scanf ("%d", &userSkill);
                fpurge(stdin);
                
                if ((userSkill != 1) || (userSkill != 2) || (userSkill!=3)) {
                    NSLog (@"Wrong choice! ");
                    continue;
                }
                else
                break;
            }
            else if (playerMode == 2) {
                NSLog (@"1. Level 1: Easy level");
                NSLog (@"2. Level 2: Loose your turn if you pick up an occupied box");
                scanf ("%d", &userSkill);
                fpurge(stdin);
                
                if ((userSkill != 1) || (userSkill != 2)) {
                    NSLog (@"Wrong choice! ");
                    continue;
                }
                else
                    break;
            }
            else if ((playerMode != 1) || (playerMode != 2)) {
                NSLog (@"Wrong choice! ");
                continue;
             
            }
        } //end of while
        
        
        if (playerMode == 1) {
            NSLog(@"Player 1 Name:  ");
            scanf ("%s", player1Name);
            fpurge(stdin);
            
//            if (userSkill == 1) {
//                
//            } //end of if (singlePlayerLevel == 1)
//            else if (userSkill == 2) {
//                
//            } //end of if (singlePlayerLevel == 2)
//            
//            else if (userSkill == 3) {
//                
//            } //end of if (singlePlayerLevel == 3)
//            
//            else if (userSkill == 2) {
//                
//            } //end of if (singlePlayerLevel == 3)
//            
//            
            
        } // end of if (singleOrMultiplayer == 1)
        
        
        else if (playerMode == 2) {
            NSLog(@"Player 1 Name:  ");
            scanf ("%s", player1Name);
            fpurge(stdin);
            
            NSLog(@"Player 2 Name:  ");
            scanf ("%s", player2Name);
            fpurge(stdin);
            
            
            if (userSkill == 1) {
                // play the game without loosing your turn
            } //end of if (multiplePlayerLevel == 1)
            
            else if (userSkill == 2) {
                // play the game and loose your turn
            } // end of if (multiplePlayerLevel == 2)
            
            
            
        } // end of if (singleOrMultiplayer == 2)
        
        
        
        
        //display grid numbers for users and instructions
        NSLog (@" 1 | 2 | 3");
        NSLog (@"-----------");
        NSLog (@" 4 | 5 | 6");
        NSLog (@"-----------");
        NSLog (@" 7 | 8 | 9");
        NSLog (@"\n");
        
        char * userOptionXorO;
        
        while (true) {
            
            NSLog(@"Choose x or o: ");
            scanf("%s", userOptionXorO);
            fpurge(stdin);
            
            // convert userOption to nsstring
            userOptionXorO_string = [NSString stringWithCString: userOptionXorO encoding: NSASCIIStringEncoding];
            
            
            //check nsConversion for good input x/o, regject everything else
            if ([userOptionXorO_string length] == 1 && ([userOptionXorO_string isEqualToString:@"x"] || [userOptionXorO_string isEqualToString:@"o"])) {
                NSLog(@"This is your choice: %@",userOptionXorO_string);
                break;
            }
            else  {
                NSLog (@"Wrong choice! ");
                continue;
            } //end nsConversion filter check
            
        } // end of while
        
        
        
        [newGame initializeArray:gridSize];
        [newGame printBoard];
        [newGame setGameLevel:&userSkill];
        [newGame setUserMode:&playerMode];
        [newGame startPlaying:userOptionXorO_string];
        
        
        
        
        
        
        
        
        
        
        
    // KRISHNA CODE
        
//        NSLog(@"Choose playerMode [1 or 2 player ");
//        scanf("%i", playerMode);
//        fpurge(stdin);
//
//        NSLog(@"Choose skill level \n 1 = have fun \n 2 = go hard \n 3 = Terror Dome ");
//        scanf("%i", userSkill);
//        fpurge(stdin);
//        

        
        
        
        
        
//        //display grid numbers for users and instructions
//        NSLog (@" 1 | 2 | 3");
//        NSLog (@"-----------");
//        NSLog (@" 4 | 5 | 6");
//        NSLog (@"-----------");
//        NSLog (@" 7 | 8 | 9");
//        NSLog (@"\n");
//        
        
        //create and initialize mutableArray
        //FUNCTION create the array
        
        //let this value come from gameLevel [ easy =9 [3x3 grid] / harder = 16 [4x4 grid] / hardest 25 [5x5 grid]
//        gridSize = userSkill;
//        
//        NSMutableArray *_board = [NSMutableArray arrayWithCapacity:gridSize];
//        
//        
        
        
        //declare variable for use holding x and o
//        char  oXchoice[2];
//        NSString * ns_oXchoice ;
//        
        
        /*-------------------------------------------start data parse ------------------------------------------------*/
        
        
//        //
//        //
//        while (true) {
//            
//            NSLog(@"Choose x or o: ");
//            scanf("%s", oXchoice);
//            fpurge(stdin);
//            
//            // convert userOption to nsstring
//            ns_oXchoice= [NSString stringWithCString: oXchoice encoding: NSASCIIStringEncoding];
//            
//            
//            //check nsConversion for good input x/o, regject everything else
//            if ([ns_oXchoice length] == 1 && ([ns_oXchoice isEqualToString:@"x"] || [ns_oXchoice isEqualToString:@"o"])) {
//                NSLog(@"This is your choice: %@",ns_oXchoice);
//                //break;
//            }
//            else  {
//                NSLog (@"Wrong choice! ");
//                continue;
//            } //end nsConversion filter check
//            
//            
//            /*--------------------------------------------------------------------------------------------------------------------------------------*/
        
            
            
//            
//            
//            for (int i=0; i<gridSize; i++) {
//                _board[i] = @" ";
//            }
//            //
//            //get a number a number from user [1-9] to choose a single grid box
//            int number;
//            /*-------------------------------------------------------Run the Game With 3x3 Grid size is coded into for loop-------------------------------------*/
//            
//            
//            for (int i =0; i<gridSize; i++){
//                
//                //run game until all _board are filled up
//                while ([_board[i] isEqualTo:@" "]) {
//                    NSLog(@"Enter a number ");
//                    scanf("%d", &number);
//                    fpurge(stdin);
//                    int adjInputForOffset;
//                    adjInputForOffset = number-1;
//                    //check for empty _board before entering user selected options
//                    if ([_board[adjInputForOffset] isNotEqualTo:@" "]){
//                        NSLog(@"please choose another box");
//                    }
//                    
//                    
//                    //if box is empty enter user selection
//                    else if ([_board[adjInputForOffset] isEqualTo:@" "]){
//                        _board[adjInputForOffset] = ns_oXchoice;
//                    }
//                    
//                    //x's and o's are transposed but still work in game
//                    if ([ns_oXchoice isEqualToString:@"x"]){
//                        ns_oXchoice = @"o";
//                    }
//                    else {
//                        ns_oXchoice = @"x";
//                        
//                    }
//                    
//                    
//                    
        
//                    
//                    
//                    
//                }
//                
//                
//            }
        
            
    //    } // end of while
//    }
//    
//    // }
//    
//    return 0;
//}
//


//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//8:30

//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
//#import <Foundation/Foundation.h>
//
//
//@interface TicTacToe : NSObject
//
//-(void) setName: (NSString *)name;
//-(NSString *)name;
//
//-(void) setUserMode: (NSString *)userMode;
//-(NSString *)userMode;
//
//@end
//
//
//@implementation TicTacToe
//NSString *_name;
//NSString *_userMode;
//
//-(void) setName: (NSString *)name{
//    _name = name;
//}
//
//-(NSString *) name {
//    return _name;
//}
//
//
//-(void) setUserMode: (NSString *)userMode{
//    _userMode = userMode;
//
//
//    //create and initialize mutableArray
//    NSMutableArray *_board = [NSMutableArray arrayWithCapacity:9];
//    for (int i=0; i<9; i++) {
//        _board[i] = @" ";
//    }
//
//    //get a number a number from user [1-9]
//    int number;
//    char * userOption;
//    NSString *oxChoice;
//    //create grid size; (9 = 3x3 grid)
//    for (int i =0; i<9; i++){
//
//
//        //run game until all _board are filled up
//        while ([_board[i] isEqualTo:@" "]) {
//            printf ("Enter a number ");
//            scanf("%d", &number);
//
//
//            //check for empty _board before entering user selected options
//            if ([_board[number-1] isNotEqualTo:@" "]){
//                NSLog(@"please choose another box");
//            }
//
//
//            //if box is empty enter user selection
//            else if ([_board[number-1] isEqualTo:@" "]){
//                _board[number-1] = oxChoice;
//            }
//
//            //working grid for playing the game
//            NSLog (@" %@ | %@ | %@ ", _board[0],_board[1],_board[2]);
//            NSLog (@"-----------");
//            NSLog (@" %@ | %@ | %@ ", _board[3],_board[4],_board[5]);
//            NSLog (@"-----------");
//            NSLog (@" %@ | %@ | %@ ", _board[6],_board[7],_board[8]);
//            NSLog (@"\n\n\n\n");
//
//
//            if ([oxChoice isEqualToString:@"x"])
//                oxChoice = @"o";
//            else
//                (oxChoice = @"x");
//
//
//
//
//
//        }
//
//
//    }//end of for LOOP
//
//
//
//}
//@end
//
//
//int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//
//        int singleOrMultiplayer;
//        int singlePlayerLevel, multiplePlayerLevel;
//        char player1Name[30], player2Name[30];
//        NSString *nsConversion ;
//
//
//        while (true) {
//            NSLog (@"1. Single player");
//            NSLog (@"2. Multiple players");
//            scanf("%d", &singleOrMultiplayer);
//            fpurge(stdin);
//
//
//            if (singleOrMultiplayer == 1) {
//                NSLog (@"1. Level 1: Computer is totally dumb.");
//                NSLog (@"2. Level 2: Computer is smarter.");
//                NSLog (@"3. Level 3: You MAY win (only when you start).");
//                NSLog (@"4. Level 4: Computer NEVER loses.");
//                scanf ("%d", &singlePlayerLevel);
//                break;
//            }
//            else if (singleOrMultiplayer == 2) {
//                NSLog (@"1. Level 1: Easy level");
//                NSLog (@"2. Level 2: Loose your turn if you pick up an occupied box");
//                scanf ("%d", &multiplePlayerLevel);
//                break;
//            }
//            else if ((singleOrMultiplayer != 1) || (singleOrMultiplayer != 2)) {
//                NSLog (@"Wrong choice! ");
//                continue;
//            }
//
//        } //end of while
//
//
//        if (singleOrMultiplayer == 1) {
//            NSLog(@"Player 1 Name:  ");
//            scanf ("%s", player1Name);
//            fpurge(stdin);
//
//            if (singlePlayerLevel == 1) {
//
//            } //end of if (singlePlayerLevel == 1)
//            else if (singlePlayerLevel == 2) {
//
//            } //end of if (singlePlayerLevel == 2)
//
//            else if (singlePlayerLevel == 3) {
//
//            } //end of if (singlePlayerLevel == 3)
//
//            else if (singlePlayerLevel == 2) {
//
//            } //end of if (singlePlayerLevel == 3)
//
//            else if (singlePlayerLevel == 4) {
//
//            } //end of if (singlePlayerLevel == 4)
//
//
//
//        } // end of if (singleOrMultiplayer == 1)
//
//
//        else if (singleOrMultiplayer == 2) {
//            NSLog(@"Player 1 Name:  ");
//            scanf ("%s", player1Name);
//            NSLog(@"Player 2 Name:  ");
//            scanf ("%s", player2Name);
//            fpurge(stdin);
//
//
//            if (multiplePlayerLevel == 1) {
//                // play the game without loosing your turn
//            } //end of if (multiplePlayerLevel == 1)
//
//            else if (multiplePlayerLevel == 2) {
//                // play the game and loose your turn
//            } // end of if (multiplePlayerLevel == 2)
//
//
//
//        } // end of if (singleOrMultiplayer == 2)
//
//
//        //display grid numbers for users and instructions
//        NSLog (@" 1 | 2 | 3");
//        NSLog (@"-----------");
//        NSLog (@" 4 | 5 | 6");
//        NSLog (@"-----------");
//        NSLog (@" 7 | 8 | 9");
//        NSLog (@"\n");
//
//        char * userOption;
//        NSString *oxChoice;
//
//
//        while (true) {
//
//            NSLog(@"Choose x or o: ");
//            scanf("%s", userOption);
//            fpurge(stdin);
//            
//            // convert userOption to nsstring
//            nsConversion = [NSString stringWithCString: userOption encoding: NSASCIIStringEncoding];
//            
//            
//            //check nsConversion for good input x/o, regject everything else
//            if ([nsConversion length] == 1 && ([nsConversion isEqualToString:@"x"] || [nsConversion isEqualToString:@"o"])) {
//                NSLog(@"This is your choice: %@",nsConversion);
//                break;
//            }
//            else  {
//                NSLog (@"Wrong choice! ");
//                continue;
//            } //end nsConversion filter check
//            
//        } // end of while
//        
//        
//        TicTacToe *user1 = [[TicTacToe alloc] init];
//        
//        [user1 setUserMode:nsConversion];
//        
    }
    return 0;
}