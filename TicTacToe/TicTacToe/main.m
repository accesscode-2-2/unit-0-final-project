//
//  main.m
//  TicTacToe
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
#import <Foundation/Foundation.h>



@interface TicTacToe : NSObject

-(void) setName: (NSString *)name;
-(NSString *)name;

-(void) setOxChoice: (NSString *)oxChoice;
-(NSString *)oxChoice;


@end


@implementation TicTacToe
NSString *_name;
NSString *_oxChoice;

-(void) setName: (NSString *)name{
    _name = name;
}

-(NSString *) name {
    return _name;
}



-(void) setOxChoice: (NSString *)oxChoice{
    _oxChoice = oxChoice;
    
    NSMutableArray *boxes = [NSMutableArray arrayWithCapacity:9];
    for (int i=0; i<9; i++) {
        boxes[i] = @" ";
    }
    NSLog (@"%@ | %@ | %@", boxes[0],boxes[1],boxes[2]);
    NSLog (@"----------");
    NSLog (@"%@ | %@ | %@", boxes[3],boxes[4],boxes[5]);
    NSLog (@"----------");
    NSLog (@"%@ | %@ | %@", boxes[6],boxes[7],boxes[8]);
    
    BOOL winnerIsX = NO;
    BOOL winnerIsO = NO;
    
    int number;
    for (int i =0; i<9; i++){
        while ([boxes[i] isEqualTo:@" "]) {
            
            
            printf ("Enter a number ");
            scanf("%d", &number);
            //123 456 789 147 258 369 159 357
            
            
            
            
            if (number == 1){
                //chech if the box is empty
                if ([boxes[0] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                }
                else boxes[0]= oxChoice ;
            }
            else if (number == 2) {
                if ([boxes[1] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else boxes[1]= oxChoice;
            }
            else if (number == 3) {
                if ([boxes[2] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else  boxes[2]= oxChoice ;
            }
            else if (number == 4){
                if ([boxes[3] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else boxes[3]= oxChoice ;
            }
            else if (number == 5){
                if ([boxes[4] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else boxes[4]= oxChoice ;
            }
            else if (number == 6){
                if ([boxes[5] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else boxes[5]= oxChoice ;
            }
            else if (number == 7){
                if ([boxes[6] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else boxes[6]= oxChoice ;
            }
            else if (number == 8){
                if ([boxes[7] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else boxes[7]= oxChoice ;
            }
            else if (number == 9){
                if ([boxes[8] isNotEqualTo:@" "]){
                    NSLog(@"please choose another box");
                } else boxes[8]= oxChoice ;
            }
            
            if ((([boxes[0] isEqualToString: @"x"]) && ([boxes [1] isEqualToString: @"x"]) && ([boxes [2] isEqualToString: @"x"])) ||
                (([boxes[3] isEqualToString: @"x"]) && ([boxes [4] isEqualToString: @"x"]) && ([boxes [5] isEqualToString: @"x"])) ||
                (([boxes[6] isEqualToString: @"x"]) && ([boxes [7] isEqualToString: @"x"]) && ([boxes [8] isEqualToString: @"x"])) ||
                (([boxes[0] isEqualToString: @"x"]) && ([boxes [3] isEqualToString: @"x"]) && ([boxes [6] isEqualToString: @"x"])) ||
                (([boxes[1] isEqualToString: @"x"]) && ([boxes [4] isEqualToString: @"x"]) && ([boxes [7] isEqualToString: @"x"])) ||
                (([boxes[2] isEqualToString: @"x"]) && ([boxes [5] isEqualToString: @"x"]) && ([boxes [8] isEqualToString: @"x"])) ||
                (([boxes[0] isEqualToString: @"x"]) && ([boxes [4] isEqualToString: @"x"]) && ([boxes [8] isEqualToString: @"x"])) ||
                (([boxes[2] isEqualToString: @"x"]) && ([boxes [4] isEqualToString: @"x"]) && ([boxes [6] isEqualToString: @"x"])))
                winnerIsX = YES;
            
            else if ((([boxes[0] isEqualToString: @"o"]) && ([boxes [1] isEqualToString: @"o"]) && ([boxes [2] isEqualToString: @"o"])) ||
                     (([boxes[3] isEqualToString: @"o"]) && ([boxes [4] isEqualToString: @"o"]) && ([boxes [5] isEqualToString: @"o"])) ||
                     (([boxes[6] isEqualToString: @"o"]) && ([boxes [7] isEqualToString: @"o"]) && ([boxes [8] isEqualToString: @"o"])) ||
                     (([boxes[0] isEqualToString: @"o"]) && ([boxes [3] isEqualToString: @"o"]) && ([boxes [6] isEqualToString: @"o"])) ||
                     (([boxes[1] isEqualToString: @"o"]) && ([boxes [4] isEqualToString: @"o"]) && ([boxes [7] isEqualToString: @"o"])) ||
                     (([boxes[2] isEqualToString: @"o"]) && ([boxes [5] isEqualToString: @"o"]) && ([boxes [8] isEqualToString: @"o"])) ||
                     (([boxes[0] isEqualToString: @"o"]) && ([boxes [4] isEqualToString: @"o"]) && ([boxes [8] isEqualToString: @"o"])) ||
                     (([boxes[2] isEqualToString: @"o"]) && ([boxes [4] isEqualToString: @"o"]) && ([boxes [6] isEqualToString: @"o"])))
                winnerIsO = YES;
            
            NSLog (@"%@ | %@ | %@", boxes[0],boxes[1],boxes[2]);
            NSLog (@"----------");
            NSLog (@"%@ | %@ | %@", boxes[3],boxes[4],boxes[5]);
            NSLog (@"----------");
            NSLog (@"%@ | %@ | %@", boxes[6],boxes[7],boxes[8]);
            NSLog (@"\n\n\n\n");
            
            
            if ([oxChoice isEqualToString:@"x"])
                oxChoice = @"o";
            else
                (oxChoice = @"x");
            
            if (winnerIsX) {
                printf("Winner is X");
                break; }
            else if (winnerIsO) {
                printf("Winner is O");
                break; }
        } //end of while
        if (winnerIsX) {
            break; }
        else if (winnerIsO) {
            break; }

    } //end of for
   
    
} //end of the function
-(NSString *) oxChoice {
    return _oxChoice;
}
@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TicTacToe *user1 = [[TicTacToe alloc] init];
        
        NSLog (@" 1 | 2 | 3");
        NSLog (@"----------");
        NSLog (@" 4 | 5 | 6");
        NSLog (@"----------");
        NSLog (@" 7 | 8 | 9");
        NSLog (@"\n");
        NSLog(@"Choose X or O: ");
        
        NSString *nsConversion ;
        char userOption[2];
        
        scanf("%s", userOption);
        
        nsConversion = [NSString stringWithCString: userOption encoding: NSASCIIStringEncoding];
        
        NSLog(@"This is your choice: %@", nsConversion);
        [user1 setOxChoice:nsConversion];
        
        
        
        
        
        //        for (int i = 1; i<=9; i++){
        //         int number;
        //            
        //
        //        }
    }
    return 0;
}
