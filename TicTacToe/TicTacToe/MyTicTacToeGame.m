//
//  MyTicTacToeGame.m
//  TicTacToe
//
//  Created by Z on 7/7/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "MyTicTacToeGame.h"
#import "Game.h"

@implementation MyTicTacToeGame

+ (void)printBoard:(Game *)game { //class method
    for (int i = 0; i < pow ([game getGameSize],2); i++) {
        
        NSString *placeHolderString = [[game getGameBoard] objectAtIndex:i];
        const char *placeHolderCharString = [placeHolderString cStringUsingEncoding:NSUTF8StringEncoding];
        
        if ((i >= [game getGameSize]) && (i % [game getGameSize]  == 0)) {
            printf("\n|%s|", placeHolderCharString);
        }
        else{
            printf("|%s|", placeHolderCharString);
        }
    }
    printf("\n");
}

+ (void)printTutorialBoard:(Game *)game{ //class method
    for (int i = 0; i < pow ([game getGameSize],2); i++) {
        
        // create a string from i
        NSString *placeNumber = [NSString stringWithFormat:@"%d",i];
        int lengthOfPlaceNumber = (int)[placeNumber length];
        
        // check the length of the sting
        if (lengthOfPlaceNumber == 1) {
            NSString *zero = [NSString stringWithFormat:@"0"];
            placeNumber = [zero stringByAppendingString:placeNumber];
        }
        //convert NSString to char string
        const char *placeNumberCharString = [placeNumber cStringUsingEncoding: NSUTF8StringEncoding];
        
        if ((i >= [game getGameSize]) && (i % [game getGameSize]  == 0)) {
            printf("\n|%s|", placeNumberCharString);
        }
        else{
            printf("|%s|", placeNumberCharString);
        }
    }
    printf("\n");
}

@end
