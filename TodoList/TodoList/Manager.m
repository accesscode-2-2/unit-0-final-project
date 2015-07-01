//
//  Manager.m
//  TodoList
//
//  Created by Jason Wang on 6/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "Manager.h"
#import "List.h"

@implementation Manager

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.lists = [[NSMutableArray alloc] init];
    }
    return self;
}

// Gets the input from scanf as an NSString
+(NSString *)getInputString {
    int numLength = 1024;
    char input[numLength];
    fgets(input, numLength, stdin);
    fflush(stdin);
    
    // Gets rid of \n at the end of each input
    size_t length = strlen(input) - 1;
    if (input[length] == '\n')
        input[length] = '\0';
    
    return [NSString stringWithUTF8String:input];
}

+(void)printString:(NSString *)string {
    printf("%s\n", [string cStringUsingEncoding:NSUTF8StringEncoding]);
}

-(List *)createList {
    List *newList = [[List alloc] init];
    [Manager printString:@"List name:"];
    newList.title = [Manager getInputString];
    [self.lists addObject:newList];
    return newList;
    
}

-(void)printMenu {
    [Manager printString:@"Main menu. Choose form the following:"];
    [Manager printString:@"1. Print all lists"];
    [Manager printString:@"2. Create List"];
    [Manager printString:@"99. Exit"];
}

-(int)getMenuInput {
    [self printMenu];
    return [Manager getInputString].intValue;
}

-(void)printLists {
    for (List *list in self.lists) {
        [Manager printString:list.title];
        [Manager printString:list.description];
    }
}

-(void)showMenu {
    while (true) {
        int input = [self getMenuInput];
        if (input == 1) {
            [self printLists];
        }
        else if (input == 2) {
            List *newList = [self createList];
            [newList showMenu];
        }
        else if (input == 99) {
            break;
        }
    }
}


@end
