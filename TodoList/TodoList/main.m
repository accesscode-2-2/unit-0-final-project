//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Homework by Xiulan 💁🏻 and Shena 🙋🏻 6/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

// *** CLASS DECLERATIONS *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***

@class ToDoItem; // 1st class manages list items
@class ToDoList; // 2nd class manages individual lists
@class ManageList; // 3rd class manages list commands

// *** 1. TO DO ITEM *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***

@interface ToDoItem : NSObject

- (void)setItem:(NSString *)itemName;
- (NSString *)itemName;
- (void)addItemName;
- (void)addPriority;
- (BOOL)isDone;


@end

@implementation ToDoItem {
    NSString *_itemName;
    int _priority;
    BOOL _isDone;
}

- (void)setItem:(NSString *)itemName {
    _itemName = itemName;
}
- (NSString *)itemName {
    return _itemName;
}

- (void)setPriority: (int)itemPriority {
    _priority = itemPriority;
}
- (int)itemPriority {
    return _priority;
}

- (void)setIsDone:(BOOL)isDone {
    _isDone = isDone;
}
- (BOOL)isDone {
    return _isDone;
}

- (void)addItemName {
    NSLog(@"Enter item: ");
    char name[256];
    fgets(name, 256, stdin); // "fgets" allows the user to input an item with more than one word ie: "cat food"
    NSString *item1 = [NSString stringWithUTF8String:name]; // we used "stringWithUTF8String" to convert char to string
    item1 = [item1 stringByReplacingOccurrencesOfString:@"\n" withString:@""]; // this line eliminated the automatic linebreak that was caused by the stringWithUTF8 function
    [self setItem: item1];
}

- (NSString *) description {
    NSString* done = @"(not done)";
    if (self.isDone) {
        done = @"(done)";
    }
    return [[NSString alloc] initWithFormat:@"%@, priority %d %@", _itemName, _priority, done];
}

- (void)addPriority {  // we set the priority level for each inputted item
    NSLog(@"New priority level 1-4:");
    int inputPriority;
    scanf("%d", &inputPriority);
    [self setPriority: inputPriority];
}

@end

// *** 2. TO DO LIST *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ** *** *** *** *** *** *** *** *** *** *** ***

@interface ToDoList : NSObject

-(NSMutableArray *)myListedItems;
-(void)addItem:(ToDoItem *)newItem;
-(void)setListName:(NSString *)listName;
-(NSString *)listName;
- (void)printAllListItems;

@end

@implementation ToDoList {
    NSMutableArray *_myListedItems;
    NSString *_listName;
}

-(NSMutableArray *)myListedItems {
    if (_myListedItems == nil) {
        _myListedItems = [[NSMutableArray alloc] init]; // initialize our list of items:
    }
    return _myListedItems;
}

-(void)addItem:(ToDoItem *)newItem {
    [[self myListedItems] addObject:newItem];
}

- (void)printAllListItems {
    NSLog(@"Your Current List Contains:");
    for (int i = 0; i < [_myListedItems count]; i++) { // created a for loop to display each item in the list
        NSLog(@"%d. %@", i+1, [_myListedItems objectAtIndex:i] );
    }
}

- (void)createItems {
    int choices, itemNo;
    while (true) { // we started our while loop to add multiple items to the list
        NSLog(@"Enter 1 to add an item.");
        if ([_myListedItems count] != 0) { // when list is empty, we don't want all 5 options to be displayed
            NSLog(@"Enter 2 to edit an item.");
            NSLog(@"Enter 3 to delete an item.");
            NSLog(@"Enter 4 to mark item as done.");
        }
        NSLog(@"Enter 0 to quit.");
        scanf("%d", &choices);
        fpurge(stdin); // "fpurge" stopped our code from displaying all at once
        if (choices == 1) {  // added "if" condition to allow the user to stop or continue adding items to list
            
            ToDoItem *newItem = [[ToDoItem alloc] init]; // created a new Item object and set its item/priority. This addes our item to the memory
            [newItem setPriority:1];
            [newItem addItemName];
            [self addItem:newItem]; // added the Item to `self`'s myListedItems array
       
        } else if (choices == 2) {
            [self printAllListItems];
            NSLog(@"Enter item number to edit/prioritize:");
            scanf("%d", &itemNo);
            fpurge(stdin);
            ToDoItem *newItem = [_myListedItems objectAtIndex:itemNo-1];
            [newItem addItemName];
            [newItem addPriority];
        } else if (choices == 3) {
            [self printAllListItems];
            NSLog(@"Enter item number to delete:");
            scanf("%d", &itemNo);
            [_myListedItems removeObjectAtIndex:itemNo-1];
        } else if (choices == 4) {
            [self printAllListItems];
            NSLog(@"Enter item number to mark as done:");
            scanf("%d", &itemNo);
            fpurge(stdin); // this prevents the code from displaying all at once
            ToDoItem *newItem = [_myListedItems objectAtIndex:itemNo-1];
            [newItem setIsDone:YES];
            
            if([newItem isDone])
                NSLog(@"%@ done", [newItem itemName]);
            
        } else if (choices == 0){
            [self printAllListItems];
            NSLog(@"End of list.\n");
            break;
        } else {
            NSLog(@"Please enter 0 - 4"); // controls incorrect user input
        }
    }
}

-(void)setListName:(NSString *)listName {
    _listName = listName;
}
-(NSString *)listName {
    return _listName;
}
-(void)addListTitle {
    NSLog(@"Please name your list:");
    char name[256];
    fgets(name, 256, stdin);
    NSString *item2 = [NSString stringWithUTF8String:name]; // converted char to NSString with the "stringWithUTF8Stirng" function
    item2 = [item2 stringByReplacingOccurrencesOfString:@"\n" withString:@""]; // this line corrects spacing issues
    [self setListName: item2];
    NSLog(@"Now, let's add items to %s list!", name);
}

@end

// *** 3. MANAGE LIST *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ** *** *** *** *** *** *** *** *** *** *** ***

@interface ManageList : NSObject

-(NSMutableArray *)manageMyList;
-(void)manageAddList:(ToDoList *)newList;
-(void)managePrintList;

@end

@implementation ManageList {
    NSMutableArray *_manageMyList;
}

-(NSMutableArray *)manageMyList {
    if (_manageMyList == nil) {
        _manageMyList = [[NSMutableArray alloc] init]; //initialize manageMylist
    }
    return _manageMyList;
}

-(void)manageAddList:(ToDoList *)newList {
    [[self manageMyList] addObject:newList];
}

-(void)managePrintList {
    for (int i = 0; i < [_manageMyList count]; i++) {
        NSLog(@"Your %@ List:", [[_manageMyList objectAtIndex:i] listName]); // this displays list categories, add items too - loop again
        ToDoList *list = [_manageMyList objectAtIndex:i];
        for (int j=0; j< [list.myListedItems count]; j++) {
            ToDoItem *item = [list.myListedItems objectAtIndex:j];
            NSLog(@"%d. %@", j+1, item);
        }
    }
}

-(void)manageNewList {
    int addList;
    while (true) {
        NSLog(@"Enter 1 to create a new list.");
        NSLog(@"Enter 0 to quit.");
        scanf("%d", &addList);
        fpurge(stdin);
       
        if (addList == 1) {
            ToDoList *newList = [[ToDoList alloc] init];
            [newList addListTitle];
            [newList createItems];
            [newList listName];
            [self manageAddList:newList];
        
        } else if (addList == 0) {
            break;
        } else {
            NSLog(@"Please enter 0 or 1.");
        }
    }
}
@end

// *** MAIN *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ** *** *** *** *** *** *** *** ***

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ManageList *newList = [[ManageList alloc] init];
        
        [newList manageNewList];
        [newList managePrintList];
        
    }
    return 0;
}
