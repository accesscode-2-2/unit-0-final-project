//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListManager;
@class ListItem;
@class List;

@interface ListManager : NSObject

-(void) printCommands;
-(void) run;
-(void) addList;
-(void) deleteList:(int)index;
-(void) printLists;


@end

@implementation ListManager{
    NSMutableArray *_toDoLists;
}



@end





@interface ListItem : NSObject

-(instancetype)initWithDefaultAndName:(NSString *)name;

@property NSInteger priority;
@property NSString *itemName;
@property BOOL completed;

-(void)changeBool;

@end

@implementation ListItem

- (instancetype) initWithDefaultAndName:(NSString *)name{
    
    if(self = [super init]){
        self.priority = 1;
        self.completed = NO;
        self.itemName = name;
        
        return self;
    }
    return nil;
}

-(void)changeBool{
    self.completed = YES;
}

@end

@interface List : NSObject

@property NSString *listName;


-(void) addItem:(ListItem *)item;
-(void) printItems;
-(void) deleteItem:(int)index;
-(void) editItem:(int)index;
-(void) markCompleted:(int)index;
-(void) setPriority:(int)value;
-(void) active;
-(void) inActive;
-(void) run;
-(void) printCommandsActive:(BOOL)active inActive:(BOOL)inActive;

@end

@implementation List{
    NSMutableArray *_items;
}
-(void) addItem:(ListItem *)item{
    
    if(_items == nil){
        _items = [[NSMutableArray alloc]init];
    }
    char temp[256];
    printf("\n Add description: ");
    scanf("%255[^\n]%*c",temp);
    fpurge(stdin);
    NSString *name = [NSString stringWithCString:temp encoding:NSASCIIStringEncoding];
    ListItem *li = [[ListItem alloc] initWithDefaultAndName:name];
    
    [_items addObject:li];
}

-(void) deleteItem:(int)index{
    NSInteger arraySize = [_items count];
    if(index < 1 || index > arraySize){
        NSString *c = [NSString stringWithFormat:@"%@",index<1? @"Must be greater than or equal to 1":@"out of bounds"];
        printf("%s",[c UTF8String]);
        return;
    }
    [_items removeObjectAtIndex:index];

}

-(void) markCompleted:(int)index{
    NSInteger arraySize = [_items count];
    if(index < 1 || index > arraySize){
        NSString *c = [NSString stringWithFormat:@"%@",index<1? @"Must be greater than or equal to 1":@"out of bounds"];
        printf("%s",[c UTF8String]);
        return;
    }
    
    [[_items objectAtIndex:index-1] changeBool];
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}
