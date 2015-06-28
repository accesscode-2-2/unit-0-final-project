//
//  ListItem.m
//  TodoList
//
//  Created by Charles Kang on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//


#import "ListItem.h"

@implementation ListItem

- (instancetype) initWithDefaultAndName:(NSString *)name{
    
    if(self = [super init]){
        self.priority = 1;
        self.finished = NO;
        self.itemName = name;
        
        return self;
    }
    return nil;
}


@end
