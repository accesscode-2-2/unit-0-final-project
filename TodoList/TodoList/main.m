//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Item: NSObject // making an item class

@end

@interface List: NSObject // making a list class


- (void) addItem:(NSString *)item; // declaring method of additem

- (NSArray *)contents;

@end

@implementation List {
    NSMutableArray *_contents;
}

- (id)init {
    _contents = [[NSMutableArray alloc] init];
    return self;
}

-(void) addItem:(NSString *)item {
    [_contents addObject:item];
}

// returns current list
- (NSArray *)contents {
    return _contents;
}


@end


@interface ToDoList: NSObject

-(void) listItems : (NSMutableArray *) items;
-(NSMutableArray *) items;

-(void) setListManger: (NSArray *) listManage;
-(NSMutableArray *) listManage;

-(void) addList: (List *) list;

@end

@implementation ToDoList {
    NSMutableArray *_items;
    NSMutableArray *_listManage;
}

-(void) listItems : (NSMutableArray *) items{
    _items = items;
}

-(NSMutableArray *) items {
    if (_listManage == nil) {
        _listManage = [[NSMutableArray alloc] init];
    }
    return _listManage;
}

-(void) setListManager: (NSMutableArray *) listManage {
    _listManage = _listManage;
}

-(void) addList: (List *) list {
    [_items addObject:list];
}


@end

// this lets the program know to take user input
NSString * scanUserInput(void) {
    char inputUTF8String[256];
    scanf("%s", inputUTF8String);
    fpurge(stdin);
    
    NSString *input = [NSString stringWithUTF8String:inputUTF8String];
    return input;
    // this returns whatever the person inputs
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ToDoList *listManage = [[ToDoList alloc]init];
        List *list = [[List alloc] init]; // initializing instance of ToDoList and List
        
        [listManage addList:list]; // communicating with class
        
        
        printf("To-Do List App\n\n\n");
        
        int tasks = 0;
        
        while (tasks <=1000)
        {
            tasks++;
            
            printf("a) Add Item           b) Delete Item\n\nc) Edit Item          d) Mark Item Done\n\ne) Show Active List   q) Quit\n");
            
            char option;
            scanf("%c", &option);
            fpurge(stdin);
            
            if (option == 'a') {
                
                NSLog(@"What would you like to add?");
                NSLog(@"Your list: %@", list.contents);
                
                NSString *input = scanUserInput();
                
                [list addItem:input];
                
                
                
            } else if (option == 'b') {
                
                NSLog(@"Delete which task?", option);
                //                 NSString *input = scanUserInput();
            } else if (option == 'c') {
                
                NSLog(@"What would you like to edit?", option);
                //                 NSString *input = scanUserInput();
                NSLog(@" %@ is done", option);
                
            } else if (option == 'd') {
                
                NSLog(@" %@ is done", option); // why is this breaking?
                //                 NSString *input = scanUserInput();
            } else if (option == 'e') {
                
                NSLog(@"This is your current list: ", option);
            } else if (option == 'q') {
                NSLog(@"See you next time!");
                break;
            }
            else  {
                NSLog(@"Invalid Option!\n", option);
            }
        }
    }
    return 0;
}
