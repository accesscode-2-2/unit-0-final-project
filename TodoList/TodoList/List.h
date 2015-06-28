//
//  List.h
//  TodoList
//
//  Created by Mesfin Bekele Mekonnen on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>


@class ListItem;

@interface List : NSObject

@property (nonatomic) NSString *listName;

-(instancetype)initWithName:(NSString *)name;

-(void) addItem;
-(void) printItems;
-(void) deleteItem:(int)index;
-(void) editItem:(int)index;
-(void) markCompleted:(int)index;
-(void) setPriority:(int)index;
-(void) active;
-(void) inActive;
-(void) run;
-(void) printCommands;

@end
