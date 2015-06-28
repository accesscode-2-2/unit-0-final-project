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

-(NSString *)getSymbol;{
    return _symbol;
}

@end


// Game Manager Class
@interface GameManager : NSObject

-(void)introScreen;
-(void)askUserForSpace:(Player *)player;
-(void)displayBlankBoard;
-(void)displayBoard:(Player *)player;
-(void)result;

@end

@implementation GameManager{
    NSString *_space;
    NSMutableArray *_normalBoard;
    NSString *_stringSpace;
    NSString *spaceChosen;
    NSString *playerChoice;
    
    
}


-(void)introScreen{
    NSLog(@"Welcome to Tic-Tac-Toe! Will you be playing against a friend or the CPU?\nA. A Friend\nB. CPU");;
    char choice[256];
    scanf("%s", choice);
    playerChoice = [NSString stringWithCString:choice encoding:NSUTF8StringEncoding];
    
    
    
   
}
-(void)askUserForSpace:(Player *)player{
    
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
    
    [player setSpace:spaceChosen];
    
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
            if ([[player getSpace] isEqualToString:_normalBoard[i][j]]) {
                if ([[player getSymbol] isEqualToString:@"X"]) {
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


-(void)displayBoard:player{
    
    
}


-(void)result{
    
//    //_normalBoard [i][j]
//    if ([j] == [j] == [j]) {
//        win;
//    }
//    if ([j] increasing or decreaing order) {
//        win;
//    }
    
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
        
        
//        Player *umar = [[Player alloc] init];
//        GameManager *simulate = [[GameManager alloc] init];
//        
//        
//        [simulate displayBlankBoard];
//        [simulate askUserForSpace:umar];
//        [simulate displayBoard:player1];
//        [simulate askUserForSpace:umar];
//        [simulate displayBoard:umar];
//        [simulate askUserForSpace:umar];
//        [simulate displayBoard:umar];
//        [simulate result];
        
        
       
        
        
        
        return 0;
    }
}
