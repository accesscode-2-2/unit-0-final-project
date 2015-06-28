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
@class ManageList;
@class ToDoList;
@class ToDoItem;

// *** ToDoItem class *** *** *** *** *** *** *** *** *** *** *** *** *** ***
@interface ToDoItem : NSObject
- (void)setItem:(NSString *)itemName;
- (NSString *)itemName;
- (void)addNameAndPriority;
//- (BOOL)noMoreItems;
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
    // "fgets" allows the user to input an item with more than one word ie: "cat food"
    char name[256];
    fgets(name, 256, stdin);
    
    NSLog(@"item added: %s", name); // we test our work above here
    
    
    
    // we used "stringWithUTF8String" to convert char to string
    NSString *item1 = [NSString stringWithUTF8String:name];
    //    NSLog(@"string test: %@", item1);
    
    [self setItem: item1];
    
    
    // we set the priority level for each inputted item
    NSLog(@"Enter priority 1 = hair on fire urgent, 2, 3, 4 = whatever, later: ");
    int inputPriority;
    scanf("%d", &inputPriority);
    
    [self setPriority: inputPriority];
    
    // we print/test the inputted item name and priority
    NSLog(@"priority level: %d", inputPriority);
}
// we set up a BOOL, so that the program knows when to stop or continue adding To Do List items:
//-(BOOL)noMoreItems {
//    NSLog(@"1 = add another item, 0 = stop adding items, my list is complete");
//    int answer;
//    scanf("%d", &answer);
//    fpurge(stdin);
//
//    return answer != 0;
//}

@end



// *** ToDoList class *** *** *** *** *** *** *** *** *** *** *** *** *** ***
@interface ToDoList : NSObject

//@property (nonatomic) NSMutableArray *myListedItems;


-(NSMutableArray *)myListedItems;
-(void)addItem:(ToDoItem *)newItem;
-(void)printList;
@end

@implementation ToDoList {
    NSMutableArray *_myListedItems;
}

//initialize our list of items:
-(NSMutableArray *)myListedItems {
    if (_myListedItems == nil) {
        _myListedItems = [[NSMutableArray alloc] init];
    }
    return _myListedItems;
}

// this initializes our list of items (same as above, but better!)
//- (instancetype)init
//{
//    if ((self = [super init])) {
//        // create myListedItems
//        _myListedItems = [[NSMutableArray alloc] init];
//    }
//    return self;
//}


-(void)addItem:(ToDoItem *)newItem {
    [[self myListedItems] addObject:newItem];
}


-(void)printList {
    //    NSLog(@"%lu", (unsigned long)[_myListedItems count]);
    for (int i = 0; i < [_myListedItems count]; i++) {
        NSLog(@"print test:%@", [[_myListedItems objectAtIndex:i] itemName]);
        
//        NSLog(@"print array: %@", [_myListedItems ob]);
    }
    
}

//-(void)setList:(NSMutableArray *)list {
//    _myListedItems = list;
//}

- (void)createItems {
    
    int add;
    while (true) {
        NSLog(@"Enter 1 to add an item or 0 to quit");
        scanf("%d", &add);
        fpurge(stdin);
        
        if (add == 1) {
            
            // created a new Item object and set its item/priority
            ToDoItem *newItem = [[ToDoItem alloc] init];
            [newItem addNameAndPriority];
            
            
            // added the Item to `self`'s myListedItems array
            [self addItem:newItem];
        } else {
            NSLog(@"you quit");
            break;
        }
    }
}

@end

// *** ManageList class *** *** *** *** *** *** *** *** *** *** *** *** *** ***

@interface ManageList : NSObject
@end

@implementation ManageList
@end

// *** MAIN *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        ToDoList *addList = [[ToDoList alloc] init];
        [addList createItems];
        [addList printList];
    }
    return 0;
}
