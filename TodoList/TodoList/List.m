//
//  List.m
//  TodoList
//
//  Created by Jason Wang on 6/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "List.h"
#import "Manager.h"

@implementation List

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

-(Item *)enterItem {
    [Manager printString:@"Enter task:"];
    NSString *task = [Manager getInputString];
    // If the user inputs nothing, return no item (nil)
    if (task.length == 0) {
        return nil;
    }
    
    [Manager printString:@"Enter priority (1 - 4):"];
    int priority = [Manager getInputString].intValue;
    
    Item *newItem = [[Item alloc] initWithContent:task priority:priority];
    [self.items addObject:newItem];
    
    return newItem;
}

-(NSString *)description
{
    NSMutableString *desc = [[NSMutableString alloc] init];
    [desc appendString:@"\n"];
    for (int i = 0; i < self.items.count; i++) {
        NSString *newLine = [NSString stringWithFormat:@"%@: %@\n", @(i+1), self.items[i]];
        [desc appendString:newLine];
    }
    return desc;
}


-(void)printMenu {
    [Manager printString:[NSString stringWithFormat:@"Submenu for %@ list. Choose form the following:", self.title]];
    [Manager printString:@"1. Add Item"];
    [Manager printString:@"2. Print list"];
    [Manager printString:@"99. Main menu"];
}

-(int)getMenuInput {
    [self printMenu];
    return [Manager getInputString].intValue;
}

-(void)showMenu {
    while (true) {
        int input = [self getMenuInput];
        if (input == 99) {
            break;
        }
        else if (input == 1) {
            [self enterItem];
        }
        else if (input == 2) {
            [Manager printString:self.description];
        }
    }
}

@end
