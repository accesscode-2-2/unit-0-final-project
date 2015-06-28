//
//  ListManager.h
//  TodoList
//
//  Created by Charles Kang on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListManager : NSObject

-(void) printCommand;
-(void) createList;
-(void) addList;
-(void) deleteList;
-(void) printLists;
-(void) editItem;
-(void) itemDone;

@end

