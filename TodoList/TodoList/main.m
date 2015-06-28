//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic) NSString *itemContent;
@property (nonatomic) int itemPriority;
@property (nonatomic) BOOL itemCompleted;


@end

@interface List : NSObject
//turn this item array of type item into a mutable array in implenetation?
@property (nonatomic) NSMutableArray *items;
@property (nonatomic) NSString *listName;
@property (nonatomic) int listPriority;


-(void)setListPriority:(int)listPriority;
-(void)removeListItem:(int)itemIndex;
-(void)scanItem;

@end

@interface Manager : NSObject

@property (nonatomic) NSMutableArray *lists;
-(void)addList:(List *)list;

@end

@implementation Item

-(BOOL) itemCompleted {
    NSLog(@"Mark Item Complete");
    char pickComplete;
    scanf("%d",&pickComplete);
    if (pickComplete == c) {
    
    }
}

@end

@implementation List

- (id)init
{
    [self setItems:[[NSMutableArray alloc]init]];
    return self;
}

@end

@implementation Manager

- (id)init
{
    [self setLists:[[NSMutableArray alloc]init]];
    return self;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Item *coffeeItem = [[Item alloc] init];
        coffeeItem.itemContent = @"Buy coffee";
        coffeeItem.itemPriority = 4;
        
        List *groceryList = [[List alloc] init];
        
        
        // this won't do anything unless `items` is initialized
        [groceryList.items addObject:coffeeItem];
        
        
    }
    return 0;
}
