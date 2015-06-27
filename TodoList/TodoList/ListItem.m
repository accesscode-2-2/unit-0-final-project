//
//  ListItem.m
//  TodoList
//
//  Created by Mesfin Bekele Mekonnen on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (instancetype) initWithDefaultAndName:(NSString *)name{
    
    if(self = [super init]){
        self.priority = 1;
        self.completed = NO;
        self.itemName = name;
        
        return self;
    }
    return nil;
}

<<<<<<< HEAD
=======

>>>>>>> 543d94c73f2970e5554ee72866a69d4cb1984f95
@end
