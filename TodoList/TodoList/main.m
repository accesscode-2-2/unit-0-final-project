//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Homework by Xiulan and Shena 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

//// create class declarations
//@class ToDoApp;
//@class ToDoList;
//@class ToDoItem;

//ToDoItem class
@interface ToDoItem : NSObject
- (void)setItem:(NSString *)itemName;
- (NSString *)itemName;
- (void)addNameAndPriority;
@end

@implementation ToDoItem {
    NSString *_itemName;
    int _priority;
}

- (void)setItem:(NSString *)itemName {
    _itemName = itemName;
}
- (NSString *)itemName {
    return _itemName;
}

- (void)setPriority: (int) priority {
    _priority = priority;
}
- (int) priority {
    return _priority;
}

- (void)addNameAndPriority {
    NSLog(@"Enter item: ");
    char name[256];
    scanf("%s", name);
    
    
    NSLog(@"added: %s", name);
    
    NSString *item1 = [NSString stringWithUTF8String:name];
    NSLog(@"string test: %@", item1);
    
    [self setItem: item1];
    
    NSLog(@"Enter priority 1, 2, 3: ");
    int inputPriority;
    scanf("%d", &inputPriority);
    
    [self setPriority: inputPriority];
    
    NSLog(@"%@, %d",item1, inputPriority);
    
}

@end



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
-(void)addItem:(ToDoItem *)newItem;
-(void)printList;

@end

@implementation ToDoList {
    NSMutableArray *_myListedItems;
}
// 6/27 note: we're not sure if this is adding items as we can't print out items. double check this! 
-(void)addItem:(ToDoItem *)newItem {
    [_myListedItems addObject:newItem];
    
}

-(void)printList {
    NSLog(@"%lu", (unsigned long)[_myListedItems count]);
    for (int i = 0; i < [_myListedItems count]; i++) {
        NSLog(@"itemName:%@", [[_myListedItems objectAtIndex:i] itemName]);
    }
   
}

//-(void)setList:(NSMutableArray *)list {
//    _myListedItems = list;
//}


@end







int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ToDoItem *addItem = [[ToDoItem alloc]init];
        [addItem addNameAndPriority];
        

        ToDoList *addList = [[ToDoList alloc] init];
        [addList addItem:addItem];
        
        [addList printList];
        
        
        
    }
    return 0;
}
