//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject
-(void)addItem;
-(void)deleteItem;
-(void)markDone;
-(NSMutableArray)setPriority:(NSInteger *)i;


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Manager;



@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@interface List : NSObject


-(void)setListName:(NSString *)list;
-(NSString *) list;
-(void)addItem:(Item *)item;

@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation List{
    NSString * _list;
    NSMutableArray* _listOfItems;
}


-(void)setListName:(NSString *)list{
    _list = list;
}
-(NSString *) list{
    return _list;
}
-(void)addItem:(Item *)item{
    if(_listOfItems == nil){
        _listOfItems = [[NSMutableArray alloc] init];
    }
    [_listOfItems addObject:item];
}


@end
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@interface Item : NSObject

@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Item{
    
    NSString * _item;
}


-(void)setItemName:(NSString *)item{
    _item = item;
}
-(NSString *) item{
    return _item;
}






@end





int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    }
    return 0;
}


@end