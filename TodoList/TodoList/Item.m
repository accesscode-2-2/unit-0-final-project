//
//  Item.m
//  TodoList
//
//  Created by Jason Wang on 6/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "Item.h"

@implementation Item

- (instancetype)initWithContent:(NSString *)content priority:(int)priority 
{
    self = [super init];
    if (self) {
        self.content = content;
        self.priority = priority;
        self.done = NO;
    }
    return self;
}

-(NSString *)description
{
    if (self.done) {
        return [NSString stringWithFormat:@"(Priority %@) [X] %@ ", @(self.priority), self.content];
    } else {
        return [NSString stringWithFormat:@"(Priority %@) [ ] %@ ", @(self.priority), self.content];
    }
    
}

@end
