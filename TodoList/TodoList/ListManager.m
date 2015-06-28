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
    
        printf("a|add               v|view\n");
        printf("d|delete            q|quit\n");
}

-(void)addList{
    if(_listArray == nil){
        _listArray = [[NSMutableArray alloc]init];
    }
    char temp[256];
    printf("\n Add title of Todo-List: ");
    scanf("%255[^\n]%*c",temp);
    fpurge(stdin);
    NSString *name = [NSString stringWithCString:temp encoding:NSASCIIStringEncoding];
    List *li = [[List alloc] initWithName:name];
    
    [_listArray addObject:li];
}

-(void) deleteList:(int)index{
    NSInteger arraySize = [_listArray count];
    if(index < 1 || index > arraySize){
        NSString *c = [NSString stringWithFormat:@"%@",index<1? @"Must be greater than or equal to 1":@"out of bounds"];
        printf("%s",[c UTF8String]);
        return;
    }
    [_listArray removeObjectAtIndex:index];
    
}

-(void) printLists{
    int i =1;
    for(List *l in _listArray){
        printf("%d. %s\n",i, [l.listName UTF8String]);
    }
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
        if([userString isEqualToString:@"q"] || [userString isEqualToString:@"Q"]){
            
            break;
        }

        
    }
    }

@end
