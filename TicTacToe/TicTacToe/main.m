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
-(void)askUserForSpace;
-(void)displayBlankBoard;
-(void)result;

@end

@implementation GameManager{
    NSString *_space;
    NSMutableArray *_normalBoard;
    NSString *_stringSpace;
    NSString *spaceChosen;
    NSString *playerChoice;
    NSString *symbolChoice;
    Player *player1;
    Player *player2;
    
    
}

// Allows player to choose whether to play against human  or computer

-(void)introScreen{
    player1 = [[Player alloc] init];
    NSLog(@"Welcome to Tic-Tac-Toe! Will you be playing against a friend or the CPU?\nA. A Friend\nB. CPU");;
    char choice[256];
    scanf("%s", choice);
    playerChoice = [NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
    
    while (!([playerChoice isEqualToString:@"A"] || [playerChoice isEqualToString: @"a"] || [playerChoice isEqualToString:@"B"] || [playerChoice isEqualToString: @"b"])){
        NSLog(@"Please choose from the options available.\nA. A Friend\nB. CPU");
        scanf("%s", choice);
        playerChoice = [NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
    }
    
    if ([playerChoice isEqualToString:@"A"] || [playerChoice isEqualToString: @"a"]) {
        player2 = [[Player alloc] init];
        NSLog(@"Player 1, what symbol would you like to use: X or O?");
        scanf("%s", choice);
        symbolChoice = [NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
        
        while (!([symbolChoice isEqualToString:@"x"] || [symbolChoice isEqualToString:@"X"] || [symbolChoice isEqualToString:@"o"] || [symbolChoice isEqualToString:@"O"])) {
            NSLog(@"Please choose from the options available: X or O?");
            scanf("%s", choice);
            symbolChoice =[NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
        }
        
        [player1 setSymbol:symbolChoice];
        if ([[player1 getSymbol] isEqualToString:@"x"] || [[player1 getSymbol] isEqualToString:@"X"]) {
            [player2 setSymbol:@"O"];
        }
        else {
            [player2 setSymbol:@"X"];
        }
        
        
        
    }
    
    
    NSLog(@"%@\n%@", [player1 getSymbol],[player2 getSymbol]);
    
    
    
}
-(void)askUserForSpace{
    
    BOOL invalid = YES;
    while (invalid) {
        NSLog(@"Please enter the space you'd like to occupy.");
        char space[256];
        scanf("%s", space);
        spaceChosen = [NSString stringWithCString:space encoding:NSUTF8StringEncoding];
        
        
        for (int i = 0; i < 3; i++){
            for (int j = 0; j < 3; j++) {
                if ([spaceChosen isEqualToString:_normalBoard[i][j]]) {
                    invalid = NO;
                }
            }
        }
        
    }
    
    [player1 setSpace:spaceChosen];
    
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
            if ([[player1 getSpace] isEqualToString:_normalBoard[i][j]]) {
                if ([[player1 getSymbol] isEqualToString:@"X"]) {
                    _normalBoard[i][j] = @"X";
                }
                else {
                    _normalBoard[i][j] = @"O";
                }
            }
        }
    }
    
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

-(void)result{
    
    for (int i = 0; i < 3; i++) {
        
        //Check horizantally
        if ((_normalBoard[i][0] == _normalBoard[i][1]) && (_normalBoard[i][0] == _normalBoard[i][2])) {
            NSLog(@"You win.");
        }
        
        if ((_normalBoard[0][i] == _normalBoard[1][i]) && (_normalBoard[0][i] == _normalBoard[2][i])){
            NSLog(@"You win.");
        }
    }
    
    
    if ((_normalBoard[0][0] == _normalBoard[1][1]) && (_normalBoard[0][0] == _normalBoard[2][2])) {
        NSLog(@"You win.");
    }
    
    if ((_normalBoard[2][0] == _normalBoard[1][1]) && (_normalBoard[2][0] == _normalBoard[0][2])) {
        NSLog(@"You win.");
    }
    
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameManager *simulate = [[GameManager alloc] init];
        
        [simulate introScreen];
        [simulate displayBlankBoard];
        [simulate askUserForSpace];
        
        return 0;
    }
}