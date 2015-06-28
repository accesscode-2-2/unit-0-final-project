//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic) NSString *content;
@property (nonatomic) int itemPriority;

//-(void)setContent:(NSString *)contentInfo andPriority: (int)contentPriority;
-(instancetype)initWithContent:(NSString *)contentInfo priority: (int)contentPriority;

@end

@interface List : NSObject
//turn this item array of type item into a mutable array in implenetation?
@property (nonatomic) NSMutableArray *items;
@property (nonatomic) NSString *listName;
@property (nonatomic) int listPriority;
@property (nonatomic) BOOL completed;


-(void)setListPriority:(int)listPriority;
-(void)removeListItem:(int)itemIndex;
-(void)scanItem;

@end

@interface Manager : NSObject

@property (nonatomic) NSMutableArray *lists;
-(void)addList:(List *)list;

@end



@implementation Item

- (instancetype)initWithContent:(NSString *)contentInfo priority:(int)contentPriority
{
    self = [super init];
    if (self) {
        self.content = contentInfo;
        self.itemPriority = contentPriority;
    }
    return self;
}

-(NSString *)description
{
    return self.content;
}

@end

@implementation List

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray array];
    }
    return self;
}

-(void)setListPriority:(int)listPriority
{
    
}

-(void)removeListItem:(int)itemIndex
{
    
}

-(void)scanItem
{
    char inputText[256];
    scanf("%s", inputText);
    Item *item = [[Item alloc] initWithContent:@(inputText) priority:(int)self.items.count];
    [self.items addObject:item];
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"%@", self.items];
}
@end

@implementation Manager

-(void)addList:(List *)list
{
    
}

@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
//        Item *newItem = [[Item alloc]init];
//        [newItem setContent:@"puppy" andPriority:1];
//        Item *newItem = [[Item alloc] initWithContent:@"puppy" priority:1];
//
//
//        List *list = [[List alloc] init];
//        [list scanItem];
//        [list scanItem];
//        printf("%s\n", [[NSString stringWithFormat:@"%@", list] UTF8String]);

    }
    return 0;
}
