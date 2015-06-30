//
//  List.h
//  TodoList
//
//  Created by Jason Wang on 6/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@interface List : NSObject

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) NSString *title;
@property (nonatomic) int priority;

-(Item *)enterItem;
-(void)showMenu;

@end
