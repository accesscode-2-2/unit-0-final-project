//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#//import "ListManager.h"
//#import "List.h"
//#import "ListItem.h"

@interface Item: NSObject

@end

@implementation Item

@end


@interface List: NSObject

- (void) addItem:(NSString *)item;
- (NSArray *)contents;

@end

@implementation List{
    NSMutableArray *_contents;
}

- (id)init {
    _contents = [[NSMutableArray alloc] init];
    return self;
}

-(void) addItem:(NSString *)item {
    [_contents addObject:item];
}

- (NSArray *)contents {
    return _contents;
}

@end


@interface ToDoList: NSObject
-(void) listItems : (NSMutableArray *) items;
-(NSMutableArray *) items;

-(void) setListManger: (NSArray *) lmanage;
-(NSMutableArray *) lmanage;

-(void) addList: (List *) list;

@end

@implementation ToDoList {
    NSMutableArray *_items;
    NSMutableArray *_lmanage;
}

-(void) listItems : (NSMutableArray *) items{
    _items = items;
}

-(NSMutableArray *) items {
    if (_lmanage == nil) {
        _lmanage = [[NSMutableArray alloc] init];
    }
    return _lmanage;
}

-(void) setListManager: (NSMutableArray *) lmanage {
    _lmanage = lmanage;
}

-(void) addList: (List *) list {
    [_items addObject:list];
}

@end

NSString * scanUserInput(void) {
    char inputUTF8String[256];
    scanf("%s", inputUTF8String);
    fpurge(stdin);
    
    NSString *input = [NSString stringWithUTF8String:inputUTF8String];
    return input;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ToDoList *lmanage = [[ToDoList alloc]init];
        List *list = [[List alloc] init];
        
        [lmanage addList:list];
        
        //list = [NSMutableArray arrayWithObjects:@"shopping, boxing, biking, eating", nil];
        
        //[list addItem:@"go swimming"];
        
        printf("To-Do List App\n\n\n");

        int tasks = 0;
        
        while (tasks <=1000)
        {
            tasks++;
            
            printf("a) Add Item\n\nb) Delete Item\n\nc) Edit Item\n\nd) Mark Item Done\n\ne) Show Active List \n\nq) Quit\n");
            
            char option;
            scanf("%c", &option);
            fpurge(stdin);
            
            if (option == 'a') {
                // ask for a title
                // create a list item instance
                // set the itemName of the list item instance
                // add list item to list
                NSLog(@"What would you like to add?\n");
                
                NSString *input = scanUserInput();
                //get input here
                [list addItem:input];
                
                NSLog(@"\n\n Your list: %@", list.contents);
                
            } else if (option == 'b') {
                
                NSLog(@"Delete which task?", option);
                 NSString *input = scanUserInput();
            } else if (option == 'c') {
                
                NSLog(@"What would you like to edit?", option);
                 NSString *input = scanUserInput();
            } else if (option == 'd') {
                
                NSLog(@"blank is done", option);
                 NSString *input = scanUserInput();
            } else if (option == 'e') {
                
                NSLog(@"This is your current list: ", option);
            } else if (option == 'q') {
                NSLog(@"See Ya!!!");
                break;
            }
             else  {
                NSLog(@"Invalid Option! \n\na)Add Item        b)Delete Item \n\nc)Edit\n\n", option);
            }
            
        }
        
        
    }
    return 0;
}






