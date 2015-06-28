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
@end

// *** ToDoList class *** *** *** *** *** *** *** *** *** *** *** *** *** ***
@interface ToDoList : NSObject

-(NSMutableArray *)myListedItems;
-(void)addItem:(ToDoItem *)newItem;
-(void)printList;
-(void)setListName:(NSString *)listName;
-(NSString *)listName;
@end

@implementation ToDoList {
    NSMutableArray *_myListedItems;
    NSString *_listName;
}

//initialize our list of items:
-(NSMutableArray *)myListedItems {
    if (_myListedItems == nil) {
        _myListedItems = [[NSMutableArray alloc] init];
    }
    return _myListedItems;
}

-(void)addItem:(ToDoItem *)newItem {
    [[self myListedItems] addObject:newItem];
}

-(void)printList {
    for (int i = 0; i < [_myListedItems count]; i++) {
        NSLog(@"print test:%@", [[_myListedItems objectAtIndex:i] itemName]);
    }
}

- (void)createItems {
    int add;
    // we started our while loop to add multiple items to the list
    while (true) {
        NSLog(@"Enter 1 to add an item or 0 to quit:");
        scanf("%d", &add);
        // "fpurge" stopped our code from displaying all at once
        fpurge(stdin);
        // added "if" condition to allow the user to stop or continue adding items to list
        if (add == 1) {
            // created a new Item object and set its item/priority. This addes our item to the memory
            ToDoItem *newItem = [[ToDoItem alloc] init];
            // this sends a message to add an item
            [newItem addNameAndPriority];

            // added the Item to `self`'s myListedItems array
            [self addItem:newItem];
        } else {
            NSLog(@"you quit");
            break;
        }
    }
}
-(void)setListName:(NSString *)listName {
    _listName = listName;
}
-(NSString *)listName {
    return _listName;
}
@end

// *** ManageList class *** *** *** *** *** *** *** *** *** *** *** *** *** ***

@interface ManageList : NSObject
-(NSMutableArray *)manageMyList;
-(void)manageAddList:(ToDoList *)newList;
-(void)managePrintList;

@end

@implementation ManageList {
    NSMutableArray *_manageMyList;
}

//initialize manageMylist
-(NSMutableArray *)manageMyList {
    if (_manageMyList == nil) {
        _manageMyList = [[NSMutableArray alloc] init];
    }
    return _manageMyList;
}

-(void)manageAddList:(ToDoList *)newList {
    [[self manageMyList] addObject:newList];
}

-(void)managePrintList {
    for (int i = 0; i < [_manageMyList count]; i++) {
        NSLog(@"Print master list: %@", [[_manageMyList objectAtIndex:i] listName]);
    }
}

-(void)manageNewList {
    int addList;
    while (true) {
        NSLog(@"Enter 1 to create a new list or 0 to quit:");
        scanf("%d", &addList);
        fpurge(stdin);
        //later we can add more functionality ie edit a list or delete a list
        if (addList == 1) {
            ToDoList *newList = [[ToDoList alloc] init];
            [newList createItems];
            
            [self manageAddList:newList];
        } else {
            NSLog(@"Good bye!");
            break;
        }
    }
}
@end

// *** MAIN *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ManageList *newList = [[ManageList alloc] init];
        
        [newList manageNewList];
        [newList managePrintList];
//        ToDoList *addList = [[ToDoList alloc] init];
//        [addList createItems];
//        [addList printList];
        
    
   }
    return 0;
}
