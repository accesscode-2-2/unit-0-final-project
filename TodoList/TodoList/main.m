//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL notQuit = 1;

@interface Manager : NSObject

-(void) mainMenu;
-(void) storeList;
-(void) addItem;
-(void) deleteItem;


@end

@implementation Manager {
    NSMutableArray *itemList;
    NSString *userADDItem;
}

-(void) mainMenu {
    NSLog(@"Add/Delete items: a/d");
    char mainMenuChoice;
    scanf ("%c", &mainMenuChoice);
    fpurge(stdin);
    if (mainMenuChoice == 'a') {
        [self addItem];
    } else if (mainMenuChoice =='d') {
        [self deleteItem];
    } else if (mainMenuChoice == 'q') {
        notQuit = 0;
    } else {
        NSLog(@"Invalid Entry");
    }
}

-(void) storeList {
    itemList = [[NSMutableArray alloc] init];
}

-(void) addItem {
    char addItem[256];
    NSLog(@"Add/Delete/Quit");
    gets(addItem);
    userADDItem = [NSString stringWithCString:addItem encoding:1];
    [itemList addObject:userADDItem];
    NSLog(@"%@", itemList);
    
}

-(void) deleteItem {
    NSLog(@"Which Item would you like to delete?");
    int udi;
    int userDeleteItem = udi+1;
    scanf("%d",&udi);
    fpurge(stdin);
    [itemList removeObjectAtIndex:userDeleteItem];
    NSLog(@"%@", itemList);
}

@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Manager *listManager = [[Manager alloc] init];
        [listManager storeList];
        
        
        while (notQuit) {
            [listManager mainMenu];
        }
        
//        [listManager addItem];
//        [listManager deleteItem];
        
        
    }
    return 0;
}
