//
//  Manager.m
//  TodoList
//
//  Created by Felicia Weathers on 6/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "List.h"
#import "Manager.h"






@implementation Manager

- (List *)createList
{
    if (!self.lists) {
        self.lists = [[NSMutableArray alloc] init];
    }
    
    List *newList = [[List alloc] init];
    [self.lists addObject:newList];
    return newList;
}


-(int)showMenu
{
    printf("What would you like to do?\n0. Exit\n1. Create a list\n2. Print lists\n3. Remove content\n4. Edit Item\n");
    fpurge(stdin);
    
    int input;
    scanf("%d", &input);
    
    return input;
}

-(void)printLists
{
    // For each list in self.lists
    for (List *list in self.lists) {
        printf("%s\n", [[NSString stringWithFormat:@"%@", list] cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}

-(void)start
{
    
    while (true) {
        int menuPicked = [self showMenu];
        
        if (menuPicked == 0) {
            break;
        }
        else if (menuPicked == 1){
            List *list = [self createList];
            while (true) {
                Item *newItem = [list scanItem];
                if (!newItem) break;
            }
        }
        else if (menuPicked == 2) {
            [self printLists];
        }
        else if (menuPicked == 3) {
            printf("Which list would you like to access?\n");
            fpurge(stdin);
            
            int accessArray;
            scanf("%d", &accessArray);
            
            printf("This list contains:\n");
            fpurge(stdin);
            
            [self printLists];
            
            printf("What would you like to remove?\n");
            fpurge(stdin);
            
            
            int deleteContent;
            scanf("%d", &deleteContent);
            
            if ([[[self.lists objectAtIndex:accessArray-1]getItems] count] >= deleteContent) {
                [[[self.lists objectAtIndex:accessArray-1]getItems]removeObjectAtIndex:deleteContent-1];
                fpurge(stdin);
            }
            else {
                printf("Sorry that is not a valid option\n");
                fpurge(stdin);
            }
        }
        /*        else if (menuPicked == 4) {
         printf("Which item would you like to mark as complete?\n");
         fpurge(stdin);
         
         [self printLists];
         
         int markDone;
         scanf("%d", &markDone);
         
         if ([[self.lists firstObject]getItems] count] >= markDone) {
         [[self.lists firstObject]getItems]
         }
         
         }*/
        else if (menuPicked == 4) {
            printf("Which list would you like to access?\n");
            fpurge(stdin);
            
            int accessArray;
            scanf("%d", &accessArray);
            
            printf("Which item would you like to edit?\n");
            fpurge(stdin);
            
            [self printLists];
            
            int replaceItem;
            scanf("%d", &replaceItem);
            
            if ([[[self.lists objectAtIndex:accessArray-1]getItems] count] >= replaceItem) {
                
                Item *newItem = [ [self.lists objectAtIndex:accessArray-1]scanItem];
                
                if (newItem != nil) {
                    
                    [[[self.lists objectAtIndex:accessArray-1]getItems] replaceObjectAtIndex:replaceItem-1 withObject:newItem];
                    
                    [[[self.lists objectAtIndex:accessArray-1]getItems] removeLastObject];
                }
            }
        }
    }
}
@end
