//
//  List.h
//  TodoList
//
//  Created by Felicia Weathers on 6/29/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#ifndef TodoList_List_h
#define TodoList_List_h

@interface List: NSObject

@property (nonatomic) NSMutableArray *items;

// Calls scanf and creates a new Item and adds that item to items array
-(Item *)scanItem;
-(NSMutableArray *)getItems;

@end


#endif
