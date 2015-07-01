//
//  main.m
//  TodoList

//   LAUREN CAPONONG & JAMAAL SEDAYAO
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


// ************************* ITEM CLASS *************************

@interface Item : NSObject

- (void)setNewItem:(NSString *)newItem;

@property (nonatomic) BOOL completed;

@end

@implementation Item {
    
    NSString *_newItem;
}


- (void)setNewItem:(NSString *)newItem{
    _newItem = newItem;
}

@end
//************************** LIST CLASS ************************

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
- (void) _completedList;
- (void) _incompleteList;
- (void) movePriority;
- (void) editItem;

@end

@implementation Manager {
    
    NSMutableArray *_completedList;
    NSMutableArray *_incompleteList;
    NSMutableArray *_yourList;
    //NSString *_newItem;
    
}


- (void) ToDoHome {
    NSLog(@"\nWhat would you like to do?\n1 | List active items\n2 | Add item(useCamelBackWords :)\n3 | Delete an item\n4 | Mark item completed\n5 | List completed items \n6 | Prioritize items \n7 | Edit Item Name");
    
    int i;
    scanf("%d", &i);
    
    if (i == 1) {
        NSLog(@"You chose to list your active items: \n");
        [self showList];
        [self ToDoHome];
    } else if (i == 2) {
        NSLog(@"You chose to add an item to the list. Please enter a description: \n");
        [self addItem];
    } else if (i == 3) {
        NSLog(@"You chose to delete an item from the list \n");
        [self deleteItem];
    } else if (i == 4) {
        NSLog(@"You chose to mark an item as completed: \n");
        [self markAsCompleted];
    } else if (i == 5 ) {
        NSLog(@"You chose to list completed items: \n");
        [self _completedList];
    } else if (i == 6) {
        NSLog(@"Please choose which item needs to be finished first: \n");
        [self movePriority];
    } else if (i == 7) {
        NSLog(@"Which item would you like to edit? ");
        [self showList];
        int edit;
        scanf("%d", &edit);
        
        NSLog(@"What do you want to replace it with? ");
        char word[25];
        scanf("%24s^\n", word);
        NSString *_newItem = [NSString stringWithUTF8String:word];     // converting to string
        
        [_yourList replaceObjectAtIndex:edit-1 withObject:_newItem];
        
        [self showList];
    } else {
        NSLog(@"Invalid entry, please choose again \n");
        [self ToDoHome];
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
        NSLog(@"%d | %@ \n",i+1, _yourList[i]);
    }
}

- (void) addItem{                               //Add item to our list
    
    char word[25];
    scanf("%24s^\n", word);
    NSString *_newItem = [NSString stringWithUTF8String:word];     // converting to string
    
    Item *newItem = [[Item alloc] init];
    
    [newItem setNewItem:(_newItem)];
    
    [_yourList addObject:_newItem];                       // add new item to your list
    
    [self ToDoHome];
    
}

- (void) deleteItem{                                         //Delete item from our list
    NSLog(@"Which item would you like to delete? \n");
    for (int i = 0; i < [_yourList count]; i++)
    {
        NSLog(@"%d | %@ \n",i+1, _yourList[i]);
    }
    
    int k;
    scanf("%d", &k);
    [_yourList removeObjectAtIndex:k-1];
    NSLog(@"Your updated active list is: \n");
    for (int i = 0; i < [_yourList count]; i++)
    {
        
        NSLog(@"%d | %@ \n",i+1, _yourList[i]);
    }
    [self ToDoHome];
}
- (void) editItem:(Item *)newItem
          atIndex:(NSInteger)j{
    
    //[_yourList replaceObjectAtIndex:<#(NSUInteger)#> withObject:<#(id)#>]
    
    [self showList];
}


- (void) movePriority{                                     //move priority to first
    
    for (int i = 0; i < [_yourList count]; i++)
    {
        NSLog(@"%d | %@ \n",i+1, _yourList[i]);
    }
    
    int z;
    scanf("%d", &z);
    [_yourList exchangeObjectAtIndex:0 withObjectAtIndex:z-1];
    
    NSLog(@"Your updated active list is: \n");
    
    for (int i = 0; i < [_yourList count]; i++)
    {
        
        NSLog(@"%d | %@ \n",i+1, _yourList[i]);
    }
    [self ToDoHome];
    
}
- (void) markAsCompleted {                            //Delete item from our list
    NSLog(@"Which item would you like to mark as completed? \n");
    for (int i = 0; i < [_yourList count]; i++)
    {
        NSLog(@"%d | %@",i+1, _yourList[i]);
    }
    
    
    int q;
    scanf("%d", &q);
    fpurge(stdin);
    
    if (_completedList == nil) {
        _completedList = [[NSMutableArray alloc] init];
    }
    
    Item *newItem = [_yourList objectAtIndex:q-1];
    
    [_completedList addObject:newItem];
    [_yourList removeObject:newItem];
}


- (void) _completedList {
    
    
    for (int i = 0; i < [_completedList count]; i++)
    {
        NSLog(@"Your completed list is:\n%d | %@ \n\n",i+1, _completedList[i]);
    }
    
    [self ToDoHome];
}


- (void) _incompleteList {
    for (int i = 0; i < [_yourList count]; i++)
    {
        NSLog(@"Your active tasks are:\n%d | %@ \n\n", i + 1, _yourList);
    }
}
@end

// ==============================================================

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"\n::::::::::::::::::blist::::::::::::::::::::");
        
        Manager *listManager = [[Manager alloc]init];
        
        [listManager createList];
        
        [listManager ToDoHome];
        
        [listManager _completedList];
        
        
        
    }
    return 0;
}