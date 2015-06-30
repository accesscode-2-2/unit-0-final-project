//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Homework by Xiulan and Shena 6/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

// *** CLASS DECLERATIONS *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***

@class ToDoItem;
@class ToDoList;
@class ManageList;

// *** TO DO ITEM CLASS *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ***

@interface ToDoItem : NSObject
- (void)setItem:(NSString *)itemName;
- (NSString *)itemName;
//- (void)addNameAndPriority;
- (void)addItemName;
- (void)addPriority;
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

//- (void)addNameAndPriority {

- (void)addItemName {
    NSLog(@"Enter item: ");
    // "fgets" allows the user to input an item with more than one word ie: "cat food"
    char name[256];
    fgets(name, 256, stdin);
    
  //  NSLog(@"item added: %s", name); // we test our work above here
    // we used "stringWithUTF8String" to convert char to string
    NSString *item1 = [NSString stringWithUTF8String:name];
    //    NSLog(@"string test: %@", item1);
    [self setItem: item1];
}

- (void)addPriority {
    // we set the priority level for each inputted item
    NSLog(@"Enter priority level:");
    NSLog(@"1 = hair on fire urgent");
    NSLog(@"2 = important");
    NSLog(@"3 = don't forget");
    NSLog(@"4 = whatever, just do it later");
    int inputPriority;
    scanf("%d", &inputPriority);
    
    [self setPriority: inputPriority];
    // we print/test the inputted item name and priority
   // NSLog(@"priority level: %d", inputPriority);
}
@end

// *** TO DO LIST CLASS *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ** *** *** *** *** *** *** *** *** *** *** ***

@interface ToDoList : NSObject

-(NSMutableArray *)myListedItems;
-(void)addItem:(ToDoItem *)newItem;
//-(void)editItem:(ToDoItem *)editItem;
//-(void)deleteItem:(ToDoItem *)deleteItem;
//-(void)printList;
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

//-(void)printList {
//    for (int i = 0; i < [_myListedItems count]; i++) {
//        NSLog(@"print test:%@", [[_myListedItems objectAtIndex:i] itemName]);
//    }
//}

- (void)createItems {
    int choices, itemNo;
    // we started our while loop to add multiple items to the list
    // when the program runs for the first time, we only want to offer the add item and quit options.
    while (true) {
        NSLog(@"Enter 1 to add an item.");
        if ([_myListedItems count] != 0) {
            NSLog(@"Enter 2 to edit an item.");
            NSLog(@"Enter 3 to delete an item.");
        }
        NSLog(@"Enter 0 to quit.");
        scanf("%d", &choices);
        // "fpurge" stopped our code from displaying all at once
        fpurge(stdin);
        // added "if" condition to allow the user to stop or continue adding items to list
        if (choices == 1) {
            // created a new Item object and set its item/priority. This addes our item to the memory
            ToDoItem *newItem = [[ToDoItem alloc] init];
            // this sends a message to add an item
           // [newItem addNameAndPriority];
            [newItem addItemName];
            [newItem addPriority];

            // added the Item to `self`'s myListedItems array
            [self addItem:newItem];
        } else if (choices == 2) {
            NSLog(@"Which item no to edit?");
            scanf("%d", &itemNo);
            fpurge(stdin);
            ToDoItem *newItem = [[ToDoItem alloc] init];
            // this sends a message to add an item
            // [newItem addNameAndPriority];
            [newItem addItemName];
            [newItem addPriority];

            [_myListedItems replaceObjectAtIndex:itemNo-1 withObject:newItem];
        } else if (choices == 3) {
            NSLog(@"which item no to delete?");
            scanf("%d", &itemNo);
            [_myListedItems removeObjectAtIndex:itemNo-1];
        } else {
            NSLog(@"Your Current List Contains:");
                for (int i = 0; i < [_myListedItems count]; i++) {
                    NSLog(@"%d %@", i+1,[[_myListedItems objectAtIndex:i] itemName]);
                }
            
            break;
        }
    }
}

//-(void)editItem:(ToDoItem *)editItem
//        atIndex:(NSInteger) e {
//    editItem = e;
//    [[self _myListedItems]replaceObjectAtIndex:editItem
//                                    withObject: _editItem];
//}
//-(void)deleteItem:(ToDoItem *)deleteItem;
//
-(void)setListName:(NSString *)listName {
    _listName = listName;
}
-(NSString *)listName {
    return _listName;
}
-(void)addListTitle {
//    NSLog(@"Enter 1 to create a new list or 0 to quit:");
    NSLog(@"Please name your list:");
    char name[256];
    fgets(name, 256, stdin);
//    NSLog(@"%s: list name", name);
    NSString *item2 = [NSString stringWithUTF8String:name];
    [self setListName: item2];
    NSLog(@"Now, let's add items to %s list!", name);

}

@end

// *** MANAGE LIST CLASS *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** *** ** *** *** *** *** *** *** *** *** *** *** ***

@interface ManageList : NSObject
-(NSMutableArray *)manageMyList;
-(void)manageAddList:(ToDoList *)newList;
-(void)managePrintList;
//-(void)manageListName;

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
        NSLog(@"Your %@", [[_manageMyList objectAtIndex:i] listName]); // this displays list categories, add items too - loop again
        
        ToDoList *list = [_manageMyList objectAtIndex:i];
        
        for (int j=0; j< [list.myListedItems count]; j++) {
            
            ToDoItem *item = [list.myListedItems objectAtIndex:j];
            
            NSLog(@"%d %@", j+1, item.itemName);
        }
    }
}

// we set an if statement so that we only run options 2 and 3 once a list exists
-(void)manageNewList {
    int addList;
    while (true) {
        NSLog(@"Enter 1 to create a new list.");
        if ([_manageMyList count] != 0) {
            NSLog(@"Enter 2 to edit a list.");
            NSLog(@"Enter 3 to delete a list.");
        }
        NSLog(@"Enter 0 to quit.");
        scanf("%d", &addList);
        fpurge(stdin);
        //later we can add more functionality ie edit a list or delete a list
        if (addList == 1) {
            ToDoList *newList = [[ToDoList alloc] init];
//            NSLog(@"Please name your list:");
//            char name[256];
//            fgets(name, 256, stdin);
//            NSString *item2 = [NSString stringWithUTF8String:name];
//            [self manageNewList];
//            NSLog(@"Now, let's add items to %s list!", name);
            [newList addListTitle];
            [newList createItems];
            [newList listName];
            
            [self manageAddList:newList];
        } else {
            NSLog(@"Good bye!");
            break;
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
