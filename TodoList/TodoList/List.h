//
//  List.h
//  TodoList
//
//  Created by Charles Kang on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@class listItem;

@interface List : NSObject

@property (nonatomic) NSString *listName;

-(instancetype) initWithName:(NSString *) name;

-(void) printCommand;
-(void) createList;
-(void) addList;
-(void) deleteList;
-(void) printLists;
-(void) editItem;
-(void) markDone;

@end
