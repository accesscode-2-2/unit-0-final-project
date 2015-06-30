//
//  main.m
//  Natalias_ToDo
//
//  Created by Natalia Estrella on 6/28/15.
//  Copyright (c) 2015 Natalia Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic) NSString *content;
@property (nonatomic) int priority;

@end

@interface List : NSObject

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) NSString *title;
@property (nonatomic) int priority;

-(void)enterItem;

@end

@interface Manager : NSObject

@property (nonatomic) NSMutableArray *lists;

-(void)start;

@end

@implementation Item

@end

@implementation List

-(void)enterItem {
}

@end

@implementation Manager

-(List *)createList {
    List *newList = [[List alloc] init];
    [self.lists addObject:newList];
    return newList;
    
}

-(void)printMenu {
    printf("Choose form the following:\n");
    printf("1. Create List\n");
    printf("2. Print all lists\n");
}

-(int)getInput {
    [self printMenu];
    int x;
    scanf("%d", &x);
    return x;
}

-(void)start {
    while (true) {
        int input = [self getInput];
        if (input == 1) {
            List *newList = [self createList];
            
        }
    }
    
    
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Manager *manager = [[Manager alloc] init];
        [manager start];
    }
    return 0;
}
