//
//  ListManager.m
//  TodoList
//
//  Created by Mesfin Bekele Mekonnen on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ListManager.h"
#import "List.h"
#import "ListItem.h"

@class List;

@implementation ListManager{
    NSMutableArray *_listArray;
}

-(void) printCommands{
}
-(void) run{
    while(YES){
        char userIn[256];
        //[self printLists]
        //[self printCommands]
        scanf("%255[^\n]%*c",userIn);
        NSString *userString = [NSString stringWithCString:userIn encoding:NSASCIIStringEncoding];
        
        if([userString isEqualToString:@"a"] || [userString isEqualToString:@"A"]){
    
            [self addList];
            continue;
        }

        if([userString isEqualToString:@"d"] || [userString isEqualToString:@"D"]){
            int d;
            printf("/nList Number? ");
            scanf("%d",&d);
            fpurge(stdin);
            NSInteger arraySize = [_listArray count];
            if(d < 1 || d > arraySize){
                NSString *c = [NSString stringWithFormat:@"%@",d<1? @"Must be greater than or equal to 1":@"out of bounds"];
                printf("%s",[c UTF8String]);
                continue;
            }
            [self addList];
            continue;
        }
        
        if([userString isEqualToString:@"v"] || [userString isEqualToString:@"V"]){
            int d;
            printf("/nIndex number? ");
            scanf("%d",&d);
            fpurge(stdin);
            NSInteger arraySize = [_listArray count];
            if(d < 1 || d > arraySize){
                NSString *c = [NSString stringWithFormat:@"%@",d<1? @"Must be greater than or equal to 1":@"out of bounds"];
                printf("%s",[c UTF8String]);
                continue;
            }
            List* temp = [_listArray objectAtIndex:d-1] ;
            [temp run];
            continue;
        }


        
    }
    }

@end
