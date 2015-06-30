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

-(Item *)enterItem;
-(void)showMenu;

@end

@interface Manager : NSObject

@property (nonatomic) NSMutableArray *lists;

+(NSString *)getInputString;
+(void)printString:(NSString *)string;

-(void)showMenu;

@end

@implementation Item

- (instancetype)initWithContent:(NSString *)content priority:(int)priority
{
    self = [super init];
    if (self) {
        self.content = content;
        self.priority = priority;
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"(Priority %@) %@", @(self.priority), self.content];
}

@end

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
    [Manager printString:@"0. Main menu"];
}

-(int)getMenuInput {
    [self printMenu];
    return [Manager getInputString].intValue;
}

-(void)showMenu {
    while (true) {
        int input = [self getMenuInput];
        if (input == 0) {
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
    
    NSString *output = [NSString stringWithUTF8String:input];
    return output;
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
    [Manager printString:@"1. Create List"];
    [Manager printString:@"2. Print all lists"];
    [Manager printString:@"0. Exit"];
}

-(int)getMenuInput {
    [self printMenu];
    return [Manager getInputString].intValue;
}

-(void)printLists {
    for (List *list in self.lists) {
        [Manager printString:list.description];
    }
}

-(void)showMenu {
    while (true) {
        int input = [self getMenuInput];
        if (input == 0) {
            break;
        }
        else if (input == 1) {
            List *newList = [self createList];
            [newList showMenu];
        }
        else if (input == 2) {
            [self printLists];
        }
    }
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Manager *manager = [[Manager alloc] init];
        [manager showMenu];
    }
    return 0;
}
