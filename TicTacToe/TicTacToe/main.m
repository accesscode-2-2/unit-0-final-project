//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>


// Player Class
@interface Player : NSObject

-(void)setSpace:(NSString *)space;
-(NSString *)getSpace;
-(void)setSymbol:(NSString *)symbol;
-(NSString *)getSymbol;

@end

@implementation Player {
    NSString *_space;
    NSString *_symbol;
}

-(void)setSpace:(NSString *)space{
    _space = space;
}

-(NSString *)getSpace{
    return _space;
}

-(void)setSymbol:(NSString *)symbol;{
    _symbol = symbol;
}


-(NSString *)getSymbol{
    return _symbol;
}

@end


// Game Manager Class
@interface GameManager : NSObject

-(void)introScreen;
-(void)askUser1ForSpace;
-(void)askUser2ForSpace;
-(void)displayBlankBoard;
-(BOOL)result;
-(BOOL)checkIfGameIsOver;

@end

@implementation GameManager{
    NSString *_space;
    NSMutableArray *_normalBoard;
    NSString *_stringSpace;
    NSString *spaceChosen;
    NSString *playerChoice;
    NSString *symbolChoice;
    int randomSelection;
    Player *player1;
    Player *player2;
    
    
}

// Allows player to choose whether to play against human  or computer

-(void)introScreen{
    
    //Initiate player objects
    player1 = [[Player alloc] init];
    player2 = [[Player alloc] init];
    
    //Ask user for choice of playing vs human or cpu
    NSLog(@"Welcome to Tic-Tac-Toe! Will you be playing against a friend or the CPU?\nA. A Friend\nB. CPU");;
    char choice[256];
    scanf("%s", choice);
    playerChoice = [NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
    
    //Input validation
    while (!([playerChoice isEqualToString:@"A"] || [playerChoice isEqualToString: @"a"] || [playerChoice isEqualToString:@"B"] || [playerChoice isEqualToString: @"b"])){
        NSLog(@"Please choose from the options available.\nA. A Friend\nB. CPU");
        scanf("%s", choice);
        playerChoice = [NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
    }
    
    //Ask user to select a symbol to use
    NSLog(@"Player 1, what symbol would you like to use: X or O?");
    scanf("%s", choice);
    symbolChoice = [NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
    
    //Input validation
    while (!([symbolChoice isEqualToString:@"x"] || [symbolChoice isEqualToString:@"X"] || [symbolChoice isEqualToString:@"o"] || [symbolChoice isEqualToString:@"O"])) {
        NSLog(@"Please choose from the options available: X or O?");
        scanf("%s", choice);
        symbolChoice =[NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
    }
    
    //Set player 1 symbol
    [player1 setSymbol:symbolChoice];
    
    //Set player 2 symbol based on player 1's symbol
    if ([[player1 getSymbol] isEqualToString:@"x"] || [[player1 getSymbol] isEqualToString:@"X"]) {
        [player2 setSymbol:@"O"];
    }
    else {
        [player2 setSymbol:@"X"];
    }
}


//Ask user1 for their space
-(void)askUser1ForSpace{
    
    
    BOOL invalid = YES;
    
    //Loop while player 1 selects a space that is already occupied
    while (invalid) {
        
        //Ask for input of space
        NSLog(@"\n\nPlayer 1, please enter the space you'd like to occupy.\n\n");
        char space[256];
        scanf("%s", space);
        
        //Convert char character into NSString
        spaceChosen = [NSString stringWithCString:space encoding:NSUTF8StringEncoding];
        
        //For loop that loops through the rows and columns of the board to see if that space is occupied; continue looping if so.
        for (int i = 0; i < 3; i++){
            for (int j = 0; j < 3; j++) {
                if ([spaceChosen isEqualToString:_normalBoard[i][j]]) {
                    invalid = NO;
                }
            }
        }
    }
    
    //Set player space to the space chosen if available
    [player1 setSpace:spaceChosen];
    
    //Loop through array; if space on board is equal to the player's space (which means it's available), replace that space with the player's symbol
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
            //Check if player space is available
            if ([[player1 getSpace] isEqualToString:_normalBoard[i][j]]) {
                
                //If space is available, replace the space with the player's symbol
                if ([[player1 getSymbol] isEqualToString:@"X"] || [[player1 getSymbol] isEqualToString:@"x"]) {
                    _normalBoard[i][j] = @"X";
                }
                else {
                    _normalBoard[i][j] = @"O";
                }
            }
        }
    }
    
    //Prints out board after the player's selection
    for (int i = 0; i < 3 ; i++) {
        int j = 0;
        NSString *rowColumn = [NSString stringWithFormat:@"%@ | %@ | %@", _normalBoard[i][j], _normalBoard[i][j+1], _normalBoard[i][j+2]];
        NSLog(@"%@", rowColumn);
        if (i < 2){
            NSLog(@"---------");
        }
    }
}

-(void)askUser2ForSpace{
    BOOL invalid = YES;
    
    //Loop while player 2 selects a space that is already occupied
    while (invalid) {
        
        //If playing vs human, ask for player 2's input on space
        if ([playerChoice isEqualToString:@"A"] || [playerChoice isEqualToString:@"a"]) {
            NSLog(@"Player 2, please enter the space you'd like to occupy.");
            char space[256];
            scanf("%s", space);
            spaceChosen = [NSString stringWithCString:space encoding:NSUTF8StringEncoding];
        }
        
        //If playing vs cpu, randomly generate a space
        if ([playerChoice isEqualToString:@"B"] || [playerChoice isEqualToString:@"b"]){
            randomSelection = (arc4random() % 8) +1;
            spaceChosen = [NSString stringWithFormat:@"%i", randomSelection];
        }
        
         //For loop that loops through the rows and columns of the board to see if that space is occupied; continue looping if so.
        for (int i = 0; i < 3; i++){
            for (int j = 0; j < 3; j++) {
                if ([spaceChosen isEqualToString:_normalBoard[i][j]]) {
                    invalid = NO;
                }
            }
        }
    }
    
    //Set player space to the space chosen if available
    [player2 setSpace:spaceChosen];
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
            if ([[player2 getSpace] isEqualToString:_normalBoard[i][j]]) {
                if ([[player2 getSymbol] isEqualToString:@"X"] || [[player2 getSymbol] isEqualToString:@"x"]) {
                    _normalBoard[i][j] = @"X";
                }
                else {
                    _normalBoard[i][j] = @"O";
                }
            }
        }
    }
    
    if ([playerChoice isEqualToString:@"B"] || [playerChoice isEqualToString:@"b"]) {
        NSLog(@"\n\nThe computer is selecting its space.\n\n");
        sleep(1);
    }
    
    //Prints out board after the player's selection
    for (int i = 0; i < 3 ; i++) {
        int j = 0;
        NSString *rowColumn = [NSString stringWithFormat:@"%@ | %@ | %@", _normalBoard[i][j], _normalBoard[i][j+1], _normalBoard[i][j+2]];
        NSLog(@"%@", rowColumn);
        if (i < 2){
            NSLog(@"---------");
        }
    }
    
}

-(void)displayBlankBoard{
    _normalBoard = [[NSMutableArray alloc] init];
    [_normalBoard insertObject:[NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil] atIndex:0];
    [_normalBoard insertObject:[NSMutableArray arrayWithObjects:@"4", @"5", @"6", nil] atIndex:1];
    [_normalBoard insertObject:[NSMutableArray arrayWithObjects:@"7", @"8", @"9", nil] atIndex:2];
    
    for (int i = 0; i < 3 ; i++) {
        int j = 0;
        NSString *rowColumn = [NSString stringWithFormat:@"%@ | %@ | %@", _normalBoard[i][j], _normalBoard[i][j+1], _normalBoard[i][j+2]];
        NSLog(@"%@", rowColumn);
        if (i < 2){
            NSLog(@"---------");
        }
    }
}


// checks for win or lose
-(BOOL)result{
    
    //Check for a win horizontally and vertically
    for (int i = 0; i < 3; i++) {
        
        //Check if there is a win vertically
        if ((_normalBoard[i][0] == _normalBoard[i][1]) && (_normalBoard[i][0] == _normalBoard[i][2])) {
            
            return YES;
            
        }
        
        //Check if there is horizontally
        if ((_normalBoard[0][i] == _normalBoard[1][i]) && (_normalBoard[0][i] == _normalBoard[2][i])){
            
            return YES;
        }
    }
    
    //Check if there is a win diagonally from top left to bottom right
    if ((_normalBoard[0][0] == _normalBoard[1][1]) && (_normalBoard[0][0] == _normalBoard[2][2])) {
        
        return YES;
    }
    
    //Check if there is a win diagonally from bottom left to top right
    if ((_normalBoard[2][0] == _normalBoard[1][1]) && (_normalBoard[2][0] == _normalBoard[0][2])) {
        
        return YES;
    }
    
    //If there isn't any wins, return the result as NO, the game has not been won
    return NO;
}

//Checks if all spaces are occupied
-(BOOL)checkIfGameIsOver{
    for (int i = 0; i < 3; i++) {
        
    
        for (int j = 0; j < 3; j++) {
            if (!([_normalBoard[i][j] isEqualToString:@"X"] || [_normalBoard[i][j] isEqualToString:@"O"])) {
                
                return NO;
            }
        }
    }
    return YES;
}

@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameManager *simulate = [[GameManager alloc] init];
        
        [simulate introScreen];
        [simulate displayBlankBoard];
        
        //Loop while the result of the game is not yet known;
        while (![simulate result]) {
            
            //Get input from user 1
            [simulate askUser1ForSpace];
            
            //If the result method returns a YES, meaning there is a win, display the result
            if ([simulate result]) {
                NSLog(@"Player 1 wins!");
                break;
            }
            
            //If all spaces are occupied, the game is over and results in a draw
            if ([simulate checkIfGameIsOver]) {
                NSLog(@"It's a draw!");
                break;
            }
            
            //Get input from user 2
            [simulate askUser2ForSpace];
            if ([simulate result]) {
                NSLog(@"Player 2 wins!");
                break;
            }
        }
        
        return 0;
    }
}

//










