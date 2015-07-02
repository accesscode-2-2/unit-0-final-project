//
//  List.m
//  toDoListFromScratchZoufAndAyuna
//
//  Created by Ayuna Vogel on 6/30/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import "List.h"
@class ListManager;
@class List;

@implementation List {
    NSString* _listName;
    NSMutableArray* _itemsInList;
}

-(void)setListName:(NSString *)listName {
    _listName = listName;
}
-(NSString*) listName {
    return _listName;
}
-(NSMutableArray*)itemsInList {
    if (_itemsInList == nil) {
        _itemsInList = [[NSMutableArray alloc] init];
    }
    return _itemsInList;
}

-(void) addItemToList: (Item*) task {
    [_itemsInList addObject:task];
}
-(void) deleteItemFromList {
    NSLog(@"Enter a number to delete task");
    int j;
    scanf("%d", &j);
    [_itemsInList removeObjectAtIndex:j-1];
}

-(void) printAllItemsInList {
    for (int i = 0; i < [_itemsInList count]; i++) {
        NSString *itemName = [[_itemsInList objectAtIndex:i] itemName];
        int itemPriority = [[_itemsInList objectAtIndex:i] itemPriority];
        NSLog(@"%i) %@, priority %d", i+1, itemName, itemPriority);
    }
}

-(void) printAllCompletedItems:(BOOL) value {
    for (int i = 0; i < [_itemsInList count]; i++) {
        if ([[_itemsInList objectAtIndex:i] markedDone] == value) {
            NSString *itemName = [[_itemsInList objectAtIndex:i] itemName];
            int itemPriority = [[_itemsInList objectAtIndex:i] itemPriority];
            NSLog(@"%i %@, priority %d", i+1, itemName, itemPriority);
        }
    }
}

-(void) markItemDone: (Item *) task {
    NSLog(@"Enter a number to mark task done");
    int j;
    scanf("%d", &j);
    for (int i = 0; i < [_itemsInList count]; i++) {
        if (i == j) {
            NSString *task = [[_itemsInList objectAtIndex:j-1] itemName];
            NSString *printTaskAsCompleted = [NSString stringWithFormat:@"✔︎ %i %@", i, task];
            [[_itemsInList objectAtIndex:j-1] setMarkedDone:YES];
            NSLog(@"%@", printTaskAsCompleted);
        }
    }
}

-(void) renameItem {
    [self printAllItemsInList];
    NSLog(@"Enter a number to edit task");
    int j;
    scanf("%d", &j);
    fpurge(stdin);
    NSLog(@"Enter new task description");
    char newTaskName[256];
    fgets(newTaskName, 256, stdin);
    NSString *editedTaskName = [NSString stringWithUTF8String:newTaskName];
    [[_itemsInList objectAtIndex:j-1] setItem:editedTaskName];
}

-(void) goBackToLists {
    //if (_lists == nil) {
        //allocate new object of ListManager
   // }
 //[[_lists objectAtIndex: i] listManagerMenuOptions];
    //    int j;
//    scanf("%d", &j);
//    for (int i = 0; i < [_lists count]; i++) {
//        if (j == 8) {
//            [[_lists objectAtIndex:i] listManagerMenuOptions];
//        }
//    }
}

-(void) addListDescription {
    NSLog(@"Enter list description: ");
    char listDescriptionInput[256];
    fgets(listDescriptionInput, 256, stdin);
    NSString *listDescription = [NSString stringWithUTF8String:listDescriptionInput];
    //stringWithUTF8String converts char to string
    [self setListName:listDescription];
}

-(void) listOptions {
    int i;
    BOOL runListOptionsMenu = true;
    while (runListOptionsMenu) {
        
        NSArray *listOptions = [[NSArray alloc] initWithObjects:@"1 - Display all tasks", @"2 - Add new task", @"3 - Edit task", @"4 - Delete task", @"5 - Mark task done", @"6 - List all active tasks", @"7 - List completed tasks", @"8 - Go back to Lists Menu", @"0 - Quit",  nil];
        
        NSLog(@"%@", listOptions);
        scanf("%d", &i);
        fpurge(stdin);
        
        if (i == 1) {
            //display all items in the selected list
            [self printAllItemsInList];
        }
        else if (i == 2) {
            //add new item
            Item *newToDoItem = [[Item alloc]init];
            [newToDoItem addItemDescription];
            [newToDoItem itemName];
            [self addItemToList:newToDoItem];
        }
        else if (i == 3) {
            //rename item
            [self renameItem];
        }
        else if (i == 4) {
            //delete item
            [self printAllItemsInList];
            [self deleteItemFromList];
            NSLog(@"Deleted");
        }
        else if (i == 5) {
            //mark task done
            [self printAllItemsInList];
            NSLog(@"Enter a task number to mark it completed");
            int i;
            scanf("%d", &i);
            //[self markItemDone];
        }
        else if (i == 6) {
            [self printAllCompletedItems:NO];
        }
        else if (i == 7) {
            //print all items in list, versions: either excluding marked done items, or print all incl marked done items with a check sign
            [self printAllItemsInList];
        }
        else if (i == 8) {
            [self goBackToLists];
        }
        else if (i == 0) {
            NSLog(@"It was good to see you! Bye!");
            break; 
        }
        else {
            NSLog(@"Bummer! Try again?");
        }
    }
}


@end

