//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListManager.h"
#import "List.h"
#import "ListItem.h"

@interface toDoList: NSObject
-(void) listItems : (NSMutableArray *) items;
-(NSMutableArray *) items;

-(void) listManager: (NSArray *) lmanage;
-(NSArray *) lmanage;


@end

@implementation toDoList {
    NSMutableArray *_items;
    NSArray *_lmanage;
}

-(void) listItems : (NSMutableArray *) items{
    _items = items;
}

-(void) listManager: (NSArray *) lmanage {
    _lmanage = lmanage;
}



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        toDoList *manage = [[toDoList alloc]init];
        
        //        [manage lmanage:@"Study,", @"Swim", @"Run", @"Jump"];
        
        
        
        printf("To-Do List App\n\n\n");
        
        
        
        printf("a) Add Item\n\nb) Delete Item\n\nc) Edit Item\n\nd) Mark Item Done\n\ne) Show Active List \n\nq) Quit\n");
        char option;
        int tasks = 0;
        
        while (tasks <=1000)
        {
            tasks++;
            
            scanf("%c", &option);
            fpurge(stdin);
            
            if (option == 'a') {
                // ask for a title
                // create a list item instance
                // set the itemName of the list item instance
                // add list item to list
                NSLog(@"What would you like to add?\n", option);
                
                
                
            } else if (option == 'b') {
                
                NSLog(@"Delete which task?", option);
                
            } else if (option == 'c') {
                
                NSLog(@"What would you like to edit?", option);
                
            } else if (option == 'd') {
                
                NSLog(@"blank is done", option);
                
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






