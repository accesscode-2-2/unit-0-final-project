//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
// delete this add
#import <Foundation/Foundation.h>

@interface toDoList: NSObject
-(void) listItems : (NSMutableArray *) items;
-(NSMutableArray *) items;


@end

@implementation toDoList {
    NSMutableArray *_items;
}

    -(void) listItems : (NSMutableArray *) items{
        _items = items;
    }



@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
            
            
        }
        printf("To-Do List App\n\n\n");
        
        
        
        printf("a) Add Item\n\nb) Delete Item\n\nc) Edit Item\n\nd) Mark Item Done\n\ne) Show Active List\n");
        char option;
        int tasks = 0;
        
        while (tasks <=1000)
        {
            tasks++;
            
            scanf("%c", &option);
            fpurge(stdin);
            
            if (option == 'a') {
                
                NSLog(@"What would you like to add?\n", option);
                scanf("\n", &items);
                
            } else if (option == 'b') {
                
                NSLog(@"Delete which task?", option);
                
            } else if (option == 'c') {
                
                NSLog(@"What would you like to edit?", option);
                
            } else if (option == 'd') {
                
                NSLog(@"blank is done", option);
                
            } else if (option == 'e') {
                
                NSLog(@"This is your current list: ", option);
            }
        }
        return 0;
    }
    
    




