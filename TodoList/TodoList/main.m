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
    
//    char mainMenuChoice;
//    scanf ("%c", &mainMenuChoice);
//    fpurge(stdin);
    

    NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
    NSString *inputLine = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    NSString *mainMenuChoice = inputLine;
    
    
    // check if the input length is 1
    // if so, check if the character is 'd', or 'q'
    // otherwise, treat the input line as a new item
    
    if ([inputLine isEqualToString: @"add"]) {
        [self addItem];
    } else if ([inputLine isEqualToString: @"delete"]) {
        [self deleteItem];
    } else if ([inputLine isEqualToString: @"quit"]){
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
        
    }
    return 0;
}
