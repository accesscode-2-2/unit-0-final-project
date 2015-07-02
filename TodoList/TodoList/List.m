//
//  List.m
//  TodoList
//
//  Created by Felicia Weathers on 6/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
#import "List.h"

@implementation List

-(NSString *)description
{
    // What gets printed when the object gets printed
    return [NSString stringWithFormat:@"%@", self.items];
}
-(Item *)scanItem
{
    if (!self.items) {
        self.items = [[NSMutableArray alloc] init];
    }
    
    printf("What would you like to add to your list? (Or enter 0 to exit) \n");
    
    
    NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
    NSString *inputLine = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    const char *command = [inputLine UTF8String];
    
    if (command[0] == '0') {
        
        return nil;
    }
    
    Item *item = [[Item alloc] init];
    item.content = (inputLine);
    
    [self.items addObject:item];
    
    return item;
}

-(NSMutableArray *)getItems
//@property (nonatomic) addComplete;

{
    return self.items;
}

@end
