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
-(void) deleteList: (int) index;
-(void) editItem: (int) index;
-(void) markDone: (int) index;
-(void) printLists;
-(void) go;
-(void) active;
-(void) inactive;


@end
