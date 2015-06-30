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
    }
    return self;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"(Priority %@) %@", @(self.priority), self.content];
}

@end
