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
    NSLog(@"Add/Delete/Quit items: ");
    
    while (notQuit) {
        
        NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
        NSString *inputLine = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        inputLine = [inputLine lowercaseString];
        
        
        if ([inputLine isEqualToString: @"add"]) {
            [self addItem];
            notQuit = 1;
        } else if ([inputLine isEqualToString: @"delete"]) {
            [self deleteItem];
            notQuit = 1;
        } else if ([inputLine isEqualToString: @"quit"]){
            notQuit = 0;
        } else {
            NSLog(@"Invalid Entry");
        }
    }

}

-(void) storeList {
    itemList = [[NSMutableArray alloc] init];
}

-(void) addItem {

    
    BOOL addNotQuit = 1;
    
    while (addNotQuit) {
        NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
        NSString *uADDItem = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        if ([uADDItem isEqualToString:@"quit"]) {
             addNotQuit = 0;
        } else if ([uADDItem isEqualToString:@"delete"]) {
            [self deleteItem];
        } else  {
            [itemList addObject:uADDItem];
            NSLog(@"%@", itemList);
        }
    }

    
    
    
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
