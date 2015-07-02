//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject // Player X uses 'x'

@end


@implementation Player

@end

@interface Computer : Player // Computer uses 'o'

- (void) computerChooseMove;

@end


@implementation Computer

- (void) computerChooseMove {
    
}

@end

@interface Tictactoe : NSObject

- (void) printLabel;

- (void) printBoard;

- (int) playerSelect;

- (int) gameSelect;

- (void) chooseMove;

- (void) chooseMove2;

- (void) computerChooseMove;

-(BOOL) endGame:(NSString *)x;

-(BOOL) endFourGame:(NSString *)x;

@property (nonatomic) NSMutableArray *spaces;

@property (nonatomic) NSArray *startingSpaces;

@property (nonatomic) NSMutableArray *fourSpaces;

@property (nonatomic) NSArray *fourStartingSpaces;

@property (nonatomic) Player * playerX;

@property (nonatomic) Computer *computer;

@end

@implementation Tictactoe

- (void) printLabel {
    
    printf("**********************************\n");
    printf("*  TIC                           *\n");
    printf("*                                *\n");
    printf("*              TAC               *\n");
    printf("*                                *\n");
    printf("*                                *\n");
    printf("*                            TOE *\n");
    printf("**********************************\n\n");
}

- (int) playerSelect {
    
    printf("**********************************\n");
    printf("*                                *\n");
    printf("*  0) Play computer              *\n");
    printf("*                                *\n");
    printf("*                                *\n");
    printf("*  1) 2-player mode              *\n");
    printf("*                                *\n");
    printf("**********************************\n");
    
    int s;
    scanf("%d", &s);
    return s;
    
}

- (int) gameSelect {
    
    printf("**********************************\n");
    printf("*                                *\n");
    printf("*  0) 3-by-3                     *\n");
    printf("*                                *\n");
    printf("*                                *\n");
    printf("*  1) 4-by-4                     *\n");
    printf("*                                *\n");
    printf("**********************************\n");
    
    int g;
    scanf("%d", &g);
    return g;
    
}

- (void) printBoard {
    
    if (self.spaces == nil) {
        self.spaces = [[NSMutableArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
        self.startingSpaces = [[NSArray alloc] initWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", nil];
    }
    
    printf("\n\n");
    
    //Tic Tac Toe Board
    
    printf("%s|%s|%s\n-----\n%s|%s|%s\n-----\n%s|%s|%s\n", [_spaces[0] UTF8String], [_spaces[1] UTF8String], [_spaces[2] UTF8String], [_spaces[3] UTF8String], [_spaces[4] UTF8String],[_spaces[5] UTF8String],[_spaces[6] UTF8String], [_spaces[7] UTF8String], [_spaces[8] UTF8String]);
}

- (void) printFourBoard {
    
    if (self.fourSpaces == nil) {
        self.fourSpaces = [[NSMutableArray alloc] initWithObjects:@"00", @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08", @"09", @"10", @"11", @"12", @"13", @"14", @"15", nil];
        self.fourStartingSpaces = [[NSArray alloc] initWithObjects:@"00", @"01", @"02", @"03", @"04", @"05", @"06", @"07", @"08",@"09", @"10", @"11", @"12", @"13", @"14", @"15", nil];
    }
    
    printf("\n\n");
    
    //4x4 Tic Tac Toe Board
    
    //Tic Tac Toe Board
    
    printf("%s|%s|%s|%s\n--------\n%s|%s|%s|%s\n--------\n%s|%s|%s|%s\n--------\n%s|%s|%s|%s\n", [_spaces[0] UTF8String], [_spaces[1] UTF8String], [_spaces[2] UTF8String], [_spaces[3] UTF8String], [_spaces[4] UTF8String],[_spaces[5] UTF8String],[_spaces[6] UTF8String], [_spaces[7] UTF8String], [_spaces[8] UTF8String],[_spaces[9] UTF8String], [_spaces[10] UTF8String], [_spaces[11] UTF8String], [_spaces[12] UTF8String], [_spaces[13] UTF8String], [_spaces[14] UTF8String], [_spaces[15] UTF8String]);
}
//First Player "X" if statement

- (void) chooseMove; {
    
    while (true) {
        
        int i;
        
        scanf("\n%d", &i);
        
        if ([_spaces[i] isEqualToString:_startingSpaces[i]]) {
            
            [_spaces replaceObjectAtIndex: i withObject: @"x"];
            
            break;
            
        } else {
            
            printf("\nThat space isn't empty! Try again! ");
            
        }
        
    }
    
    [self printBoard];
}
//Second Player "O" if statement

- (void) chooseMove2 {
    
    while (true) {
        
        int a;
        
        scanf("\n%d", &a);
        
        if ([_spaces[a] isEqualToString:_startingSpaces[a]]) {
            
            [_spaces replaceObjectAtIndex: a withObject: @"o"];
            
            break;
            
        } else {
            
            printf("\nThat space isn't empty! Try again! ");
        }
        
    }
    
    [self printBoard];
    
}

- (void) computerChooseMove {
    
    int c;
    
    BOOL moveChosen = NO;
    
    while (!moveChosen) {
        
        c = arc4random_uniform(9);
        
        if ([_spaces[c] isEqualToString:_startingSpaces[c]]) {
            
            [_spaces replaceObjectAtIndex: c withObject: @"o"];
            
            [self printBoard];
            
            moveChosen = YES;
            
        } else if (_spaces[0] != _startingSpaces[0] && _spaces[1] != _startingSpaces[1] && _spaces[2] != _startingSpaces[2] && _spaces[3] != _startingSpaces[3] && _spaces[4] != _startingSpaces[4] && _spaces[5] != _startingSpaces[5] && _spaces[6] != _startingSpaces[6] && _spaces[7] != _startingSpaces[7] && _spaces[8] != _startingSpaces[8]) {
            
            break;
            
        } else {
            
            printf("Hmmm ... ");
            sleep(1);
        }
    }
    
}

-(BOOL) endGame:(NSString *)x {
    
    if (_spaces[0] != _startingSpaces[0] && _spaces[1] != _startingSpaces[1] && _spaces[2] != _startingSpaces[2] && _spaces[3] != _startingSpaces[3] && _spaces[4] != _startingSpaces[4] && _spaces[5] != _startingSpaces[5] && _spaces[6] != _startingSpaces[6] && _spaces[7] != _startingSpaces[7] && _spaces[8] != _startingSpaces[8]) {
        
        printf("\nTWO-WAY TIE!!!!");
        
        return YES;
    
    } else if (_spaces[0] == x && _spaces[1] == x && _spaces[2] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[3] == x && _spaces[4] == x && _spaces[5] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[6] == x && _spaces[7] == x && _spaces[8] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[2] == x && _spaces[5] == x && _spaces[8] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[0] == x && _spaces[3] == x && _spaces[6] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[1] == x && _spaces[4] == x && _spaces[7] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[0] == x && _spaces[4] == x && _spaces[8] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[2] == x && _spaces[4] == x && _spaces[6] == x) {
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_spaces[0] != _startingSpaces[0] && _spaces[1] != _startingSpaces[1] && _spaces[2] != _startingSpaces[2] && _spaces[3] != _startingSpaces[3] && _spaces[4] != _startingSpaces[4] && _spaces[5] != _startingSpaces[5] && _spaces[6] != _startingSpaces[6] && _spaces[7] != _startingSpaces[7] && _spaces[8] != _startingSpaces[8]) {
        
        printf("\nTWO-WAY TIE!!!!");
        
        return YES;
        
    } else {
    
        return NO;
        
    }
        //win conditions -- 012 345 678 258 036 147 048 246
    
    
}

-(BOOL) endFourGame:(NSString *)x {
    
    if (_fourSpaces[0] == x && _fourSpaces[1] == x && _fourSpaces[2] == x && _fourSpaces[3] == x) { //Top/First Row
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_fourSpaces[3] == x && _fourSpaces[7] == x && _fourSpaces[11] == x &&_fourSpaces[15] == x) { //Right Going down
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_fourSpaces[4] == x && _fourSpaces[5] == x && _fourSpaces[6] == x &&_fourSpaces [7] == x) { // Second Row
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_fourSpaces[3] == x && _fourSpaces[6] == x && _fourSpaces[9] == x &&_fourSpaces[12] == x) { // Top Right to Bottom Left
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_fourSpaces[0] == x && _fourSpaces[4] == x && _fourSpaces[8] == x && _fourSpaces[12] == x) { //Left going down
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_fourSpaces[8] == x && _fourSpaces[9] == x && _fourSpaces[10] == x &&_fourSpaces[11] == x) { //Third Row
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_fourSpaces[1] == x && _fourSpaces[5] == x && _fourSpaces[9] == x &&_fourSpaces[13] == x) { //Second Row Down
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
        
    } else if (_fourSpaces[2] == x && _fourSpaces[6] == x && _fourSpaces[10] == x &&_fourSpaces[14] == x) { //Third row down
        
        if ([x isEqualToString: @"x"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        } else {
            
            printf("\nComputer WINS!!!!!!!");
            
            return YES;
        }
    } else if (_fourSpaces[0] == x && _fourSpaces[5] == x && _fourSpaces[10] == x &&_fourSpaces[15] == x) { //Top Left to Bottom Right
        
        if ([x isEqualToString: @"X"]) {
            
            printf("\nPlayer X WINS!!!!!!!!!");
            
            return YES;
            
        }
        
    } else if (_fourSpaces[0] != _fourStartingSpaces[0] && _fourSpaces[1] != _fourStartingSpaces[1] && _fourSpaces[2] != _fourStartingSpaces[2] && _fourSpaces[3] != _fourStartingSpaces[3] && _fourSpaces[4] != _fourStartingSpaces[4] && _fourSpaces[5] != _fourStartingSpaces[5] && _fourSpaces[6] != _fourStartingSpaces[6] && _fourSpaces[7] != _fourStartingSpaces[7] && _fourSpaces[8] != _fourStartingSpaces[8] && _fourSpaces[9] != _fourStartingSpaces[9] && _fourSpaces[10] != _fourStartingSpaces[10] && _fourSpaces[11] != _fourStartingSpaces[11] && _fourSpaces[12] != _fourStartingSpaces[12] && _fourSpaces[13] != _fourStartingSpaces[13] && _fourSpaces[14] != _fourStartingSpaces[14] && _fourSpaces[15] != _fourStartingSpaces[15])
            
            printf("\nTWO-WAY TIE!!!!");
    
            return YES;
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Tictactoe *game1 = [[Tictactoe alloc] init];
        
        [game1 printLabel];
        int gameMode = [game1 playerSelect];
        [game1 printBoard];
        
        //While loop for repeat
        
        while ([game1 endGame:@"x"] == NO && [game1 endGame:@"o"] == NO) {
            
            printf("\nHello Player 'X'\nWhere would you like to play: ");
            [game1 chooseMove];
            [game1 endGame:@"x"];
            
            
            if (gameMode == 1) {
            
                printf("\nHello Player 'O'\nWhere would you like to play: ");
                [game1 chooseMove2];
                [game1 endGame:@"o"];
                
            } else {
                
                printf("\nComputer is thinking ... ");
                [game1 computerChooseMove];
                [game1 endGame:@"o"];
                
            }
        }
        
    }
    return 0;
}
