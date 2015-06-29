//
//  ListItem.h
//  TodoList
//
//  Created by Mesfin Bekele Mekonnen on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject
-(instancetype)initWithDefaultAndName:(NSString *)name;

@property (nonatomic) int priority;
@property (nonatomic) NSString *itemName;
@property (nonatomic) BOOL completed;
@property (nonatomic) int idNumber;
@property (nonatomic) NSDate* date;
@property (nonatomic) BOOL hasDate;

@end
