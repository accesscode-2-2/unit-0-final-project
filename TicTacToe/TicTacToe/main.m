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

@end

@implementation Player {
    NSString *_space;
}

-(void)setSpace:(NSString *)space{
    _space = space;
}

-(NSString *)getSpace{
    return _space;
}

@end

//// Board class
//@interface Board : NSObject
//
//-(void)displayBoard;
//
//@end
//
//@implementation Board{
//    NSMutableArray *_normalBoard;
//}
//
//-(void)displayBoard{
//
//    //If board is not yet created, create it
//
//    _normalBoard = [[NSMutableArray alloc] init];
//
//    [_normalBoard insertObject:[NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil] atIndex:0];
//    [_normalBoard insertObject:[NSMutableArray arrayWithObjects:@"4", @"5", @"6", nil] atIndex:1];
//    [_normalBoard insertObject:[NSMutableArray arrayWithObjects:@"7", @"8", @"9", nil] atIndex:2];
//
//
//
//
//    //Display the board
//    for (int i = 0; i < 3 ; i++) {
//        int j = 0;
//        NSString *rowColumn = [NSString stringWithFormat:@"%@ | %@ | %@", _normalBoard[i][j], _normalBoard[i][j+1], _normalBoard[i][j+2]];
//        NSLog(@"%@", rowColumn);
//
//        if (i < 2){
//            NSLog(@"---------");
//        }
//    }
//}
//
//@end


// Game Manager Class
@interface gameManager : NSObject

-(void)askUserForSpace:(Player *)player;
-(void)displayBlankBoard;
-(void)displayBoard:(Player *)player;


@end

@implementation gameManager{
    NSString *_space;
    NSMutableArray *_normalBoard;
    NSString *_stringSpace;
}

-(void)askUserForSpace:(Player *)player{
    NSLog(@"Please enter the space you'd like to occupy.");
    char space[256];
    scanf("%s", space);
    NSString *spaceChosen = [NSString stringWithCString:space encoding:NSUTF8StringEncoding];
    
    [player setSpace:spaceChosen];
    
    NSLog(@"%@", [player getSpace]);
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
    
    for (int i = 0; i < 3; i++){
        for (int j = 0; j < 3; j++) {
            if ([[player getSpace] isEqualToString:_normalBoard[i][j]]) {
               _normalBoard[i][j] = @"X";
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

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        Player *umar = [[Player alloc] init];
        
        gameManager *simulate = [[gameManager alloc] init];
        
        
        [simulate displayBlankBoard];
        [simulate askUserForSpace:umar];
        [simulate displayBoard:umar];
       
        
        
        
        
        
        
        return 0;
    }
}
