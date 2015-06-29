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
        self.hasDate = NO;
        
        NSDateComponents *c = [[NSDateComponents alloc]init];
        
        [c setDay:30];
        [c setMonth:12];
        [c setYear:3000];
        
        NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSDate *date = [calendar dateFromComponents:c];
        
        self.date = date;
        
        
        return self;
    }
    return nil;
}


@end
