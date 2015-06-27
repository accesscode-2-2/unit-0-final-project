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

@property NSInteger priority;
@property NSString *itemName;
@property BOOL completed;

-(void)changeBool;
@end
