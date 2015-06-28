//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
//Requirements
//
//1. Does not crash.
//2. Gracefully handle unacceptable user input
//3. Structural requirements
//
// A class to manage your todo lists
// A class to represent a todo list
// A class to represent a todo item
//
//Features
//
//1. Create lists *
//2. Add an item to a list *
//3. Delete an item from a list *
//4. Mark an item as "done"
//5. Edit an item
//6. Set priority on items (1 - 4; default = 1);
//7. List active (not marked done) items in list
//8. List inactive (marked done) items in list


#import <Foundation/Foundation.h>

@class Item;
@class Manager;
@class List;

// ************************* Represent To Do Item *************************

@interface Item : NSObject
-(void)setNewItem:(NSString *)newItem;


@end

@implementation Item {
    NSString *_newItem;
}
-(void)setNewItem:(NSString *)newItem{
    _newItem = newItem;
}


@end


//************************** Represent To Do List ************************

@interface List : NSObject
- (void) setNewList:(NSMutableArray *)newList;


@end

@implementation List{
    NSMutableArray *_newList;
}
- (void) setNewList:(NSMutableArray *)newList{
    _newList = newList;
}



@end


//******************************** Manager *********************************
@interface Manager : NSObject

- (void) ToDoHome;
- (void) createList;
- (void) showList;
- (void) addItem;
- (void) deleteItem;
- (void) completedList;

@end

@implementation Manager {

    NSMutableArray *_yourList;
    NSMutableArray *_completedList;
    //NSString *_newItem;

}


- (void) ToDoHome {
    NSLog(@"What would you like to do?\n1- list items\n2- add item\n3- delete item\n4- mark item done\n5- list completed item");

    
    int i;
    scanf("%d", &i);
 
//    for (int j = 0; j < 5; j++) {
    
        if (i == 1) {
            NSLog(@"You chose to list items");
            [self showList];
        }
        
        if (i == 2) {
            NSLog(@"You chose to add an item. Please enter a description:");
            [self addItem];
        }
        
        if (i == 3) {
            NSLog(@"You chose to delete an item \n");
            [self deleteItem];
        }
        
        if (i == 4) {
            NSLog(@"You chose to mark an item as completed: \n");
            [self markComplete];
        }
        
        if (i == 5 ) {
            NSLog(@"You chose to list completed items: \n");
            [self completedList];
        }

        }

- (void) createList{                // creating list if there is none

    List *newList = [[List alloc] init];
    
    [newList setNewList:(_yourList)];
    
    _yourList = [[NSMutableArray alloc] init];      // initializing array
    
}
- (void) showList{                              //Show our list as it is
 
    
    for (int i = 0; i < [_yourList count]; i++)
    {
        NSLog(@"%d %@",i+1, _yourList[i]);
    }
    
    [self ToDoHome];
}

- (void) addItem{                               //Add item to our list

    char word;
    scanf("%s", &word);
    NSString *_newItem = [NSString stringWithUTF8String:&word];     // converting to string
    
    Item *newItem = [[Item alloc] init];
    
    [newItem setNewItem:(_newItem)];
    
    [_yourList addObject:_newItem];                                 // add new item to your list
    
    [self ToDoHome];
    
}

- (void) deleteItem{                            //Delete item from our list
    NSLog(@"Which item would you like to delete? ");
    for (int i = 0; i < [_yourList count]; i++)
    {
        NSLog(@"%d %@",i+1, _yourList[i]);
    }
    
    int k;
    scanf("%d", &k);
    [_yourList removeObjectAtIndex:k-1];
    NSLog(@"Your updated list is:");
    for (int i = 0; i < [_yourList count]; i++)
    {

        NSLog(@"%d %@",i+1, _yourList[i]);
    }
    [self ToDoHome];
}

- (void) markComplete{
    NSLog(@"Which item is complete? ");
    for (int i = 0; i < [_yourList count]; i++)
    {

        NSLog(@"%d %@",i+1, _yourList[i]);
    }
    
    int q;
    scanf("%d", &q);
    NSString *complete = @"complete";

    [_yourList insertObject:complete atIndex:q-1];
    
    NSLog(@"Your updated list is:");
    for (int i = 0; i < [_yourList count]; i++)
    {
        
        NSLog(@"%d %@",i+1, _yourList[i]);
    }
  //  [self ToDoHome];
}





- (void) completedList {                // creating list if there is none
    
    _completedList = [[NSMutableArray alloc] init];      // initializing array
    
    for (int i = 0; i < [_completedList count]; i++)
    {
        NSLog(@"%d %@",i+1, _completedList[i]);
    }
    

}


@end


//
////************************** Represent To Do List ************************
//
//@interface List : NSObject
//
//
//@end
//
//@implementation List
//
//
//@end
//
//

//// ************************* Represent To Do Item *************************
//
//@interface Item : NSObject
//-(void)setNewItem:(NSString *)newItem;
//
//@end
//
//@implementation Item {
//    NSString *_newItem;
//}
//-(void)setNewItem:(NSString *)newItem{
//    _newItem = newItem;
//}
//@end


// ==============================================================

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Manager *listManager = [[Manager alloc]init];
        
        [listManager createList];
        
        [listManager ToDoHome];
        
        [listManager completedList];
        

        
        
        
    }
    return 0;
}
