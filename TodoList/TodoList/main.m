//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Homework by Xiulan and Shena 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

// create class declarations
@class ToDoApp;
@class ToDoList;
@class ToDoItem;

//ToDoApp class (we declare methods here)
@interface ToDoApp : NSObject
@end

@implementation ToDoApp
@end

//ToDoList class
@interface ToDoList : NSObject
//- (void)setListTitle:(NSString *)title;
//- (NSString *)title;
//- (void)setList:
@end

@implementation ToDoList
@end

//ToDoItem class
@interface ToDoItem : NSObject
- (void)setItem:(NSString *)item;
- (NSString *)item;
- (void)addNameAndPriority;
@end

@implementation ToDoItem {
    NSString *_item;
    int _priority;
}

- (void)setItem:(NSString *)item {
    _item = item;
}
- (NSString *)item {
    return _item;
}

- (void)setPriority: (int) priority {
    _priority = priority;
}
- (int) priority {
    return _priority;
}

- (void)addNameAndPriority {
    NSLog(@"Enter item: ");
    char itemName[256];
    scanf("%s", itemName);
    
    
    NSLog(@"added: %s", itemName);
    
    NSString *item1 = [NSString stringWithUTF8String:itemName];
    NSLog(@"string test: %@", item1);
    
    [self setItem: item1];
    
    NSLog(@"Enter priority 1, 2, 3: ");
    int inputPriority;
    scanf("%d", &inputPriority);
    
    [self setPriority: inputPriority];
    
    NSLog(@"%@, %d",item1, inputPriority);

}

@end






int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ToDoItem *addItem = [[ToDoItem alloc]init];
        [addItem addNameAndPriority];
        
    }
    return 0;
}
