//
//  ListManager.h
//  TodoList
//
//  Created by Mesfin Bekele Mekonnen on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListManager : NSObject

-(void) run;
-(void) addList;
-(void) deleteList:(int)index;
-(void) printLists;
-(void) printCommands;
-(BOOL) outOfBounds:(int)index;
-(int) getIndex;

@end
