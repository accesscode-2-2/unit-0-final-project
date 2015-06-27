//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ToDoList: NSObject

@property  NSMutableArray *_taskArray;


-(void)listItems:(NSMutableArray *)listItems;
-(NSMutableArray *)listItems;


//-(void)addItems:(NSMutableArray *)addItems;
//-(NSString *)addItems;
//
//-(void)removeItems:(NSMutableArray *)removeItems;
////removeItems;
//
//-(void)markItemDone:(NSMutableArray *)markItemDone;
//-(NSMutableArray *)listItems;
//
//-(void)listCompletedItem:(NSMutableArray *)listCompletedItem;
//-(NSMutableArray *)listCompletedItem;


@end


@implementation ToDoList

-(void)listItems:(NSMutableArray *)listItems {
    
    for(int counter=0; counter<=[listItems count]; counter++){
        NSLog(@"%c", listItems[counter].name);
        
    }
    
}
@end

////////////////////

@interface Item: NSObject

@end

@implementation Item


@end

////


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        

        
        
    }
    return 0;
}
