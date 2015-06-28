//
//  ListManager.h
//  TodoList
//
//  Created by Charles Kang on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListManager.h"
#import "List.h"
#import "ListItem.h"

@class listManager;

@interface ListManager : NSObject

-(void) printCommand;
-(void) addList;
-(void) deleteList: (int) index;
-(void) editItem: (int) index;
-(void) markDone: (int) index;
-(void) printLists;
-(void) priority;
-(void) active;
-(void) inactive;


@end

