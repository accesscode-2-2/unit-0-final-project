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
//1. Create lists
//2. Add an item to a list
//3. Delete an item from a list
//4. Mark an item as "done"
//5. Edit an item
//6. Set priority on items (1 - 4; default = 1);
//7. List active (not marked done) items in list
//8. List inactive (marked done) items in list


#import <Foundation/Foundation.h>

//To Do List Manager

@interface Manager : NSObject

- (void) ToDoHome;
- (void) createList;

@end

@implementation Manager {

    NSMutableArray *_yourList;


}



- (void) ToDoHome {
    NSLog(@"What would you like to do?\n1- list items\n2- add item\n3- remove item\n4- mark item done\n5- list completed item");
    
    
    int i;
    scanf("%d", &i);
 
    for (int j = 0; j < 5; j++) {
    
        if (i == 1) {
            NSLog(@"You chose to list items");
            NSLog(@"Your list:");
            _yourList = [[NSMutableArray alloc] init];
            NSLog(@"%@", _yourList);
        }
        
        if (i == 2) {
            NSLog(@"You chose to add an item");
        }
        
        if (i == 3) {
            NSLog(@"You chose to remove an item");
        }
        
        if (i == 4) {
            NSLog(@"You chose to mark an item as completed");
        }
        
        if (i == 5 ) {
            NSLog(@"You chose to list completed item"); }

        }
    
}




//
//- (void) createList{                // creating list if there is none
//    if (_list == nil) {
//    _list = [[NSMutableArray alloc] init];
//    }   else {
//        [_list addObject:listItem];
//    }
//}



- (void) addItem {
    
}


@end




// Represent To Do List

@interface ToDoList : NSObject

@end

@implementation ToDoList

@end




// Represent To Do Item

@interface Item : NSObject

@end

@implementation Item

@end


// ==============================================================

int main(int argc, const char * argv[]) {
    @autoreleasepool {
    
        Manager *ListManager = [[Manager alloc]init];
        [ListManager ToDoHome];
//        [ListManager createList];
        
        
        
        
    }
    return 0;
}
