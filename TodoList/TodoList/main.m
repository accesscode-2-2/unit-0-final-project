//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@class List;
@class Item;
@class Manager;


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@interface List : NSObject


- (instancetype)initWithListName:(NSString *)listName;

-(void)addItem:(Item *)item;

-(NSMutableArray *)listOfItems;



@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation List{
    NSString* _list;
    NSMutableArray* _listOfItems;
}


- (instancetype)initWithListName:(NSString *)listName{
    if (self = [super init]) {
        _list = listName;
        return self;
    }
    return nil;
    
}

-(NSMutableArray *)listOfItems{
    if(_listOfItems == nil){
        _listOfItems = [[NSMutableArray alloc] init];
    }
    return _listOfItems;
}

-(void)addItem:(Item *)item{
    [[self listOfItems] addObject:item];
}



@end
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


@interface Item : NSObject

- (instancetype)initWithItemName:(NSString *)title;
- (NSString *) getItemName;

@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Item{
    NSString * _itemName;
}


- (instancetype)initWithItemName:(NSString *)title{
    if (self = [super init]) {
        _itemName = title;
        return self;
    }
    return nil;
    
}

-(NSString *)getItemName{
    return _itemName;
}


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@interface Manager : NSObject

-(void)displayItems:(List *)list;

//-(void)markDone;
//-(void)setPriority:(NSInteger *)i;


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Manager{
    
}

-(void)displayItems:(List *)list{
    NSMutableArray *myListOfItems = [list listOfItems];
    for (int i = 0; i < [myListOfItems count]; i++) {
        NSLog(@"%@", [myListOfItems[i] getItemName]);
    }
}



@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Manager *listManager = [[Manager alloc] init];
        
        List *toDoToday = [[List alloc] initWithListName:@"To Do Today"];
        
        Item *swim = [[Item alloc] initWithItemName:@"swim"];
        Item *yoga = [[Item alloc] initWithItemName:@"yoga"];
        Item *practiceGuitar = [[Item alloc] initWithItemName:@"practice guitar"];
        
        [toDoToday addItem:swim];
        [toDoToday addItem:yoga];
        [toDoToday addItem:practiceGuitar];
        
        [listManager displayItems:toDoToday];
        
        
        
        
    }
    return 0;
}


//@end