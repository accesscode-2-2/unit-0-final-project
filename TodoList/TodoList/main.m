//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@class List;
@class Task;
@class Manager;


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@interface List : NSObject


- (instancetype)initWithListName:(NSString *)listName;

-(void)addTask:(Task *) task;

-(NSMutableArray *)listOfTasks;



@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation List{
    NSString* _list;
    NSMutableArray* _listOfTasks;
}


- (instancetype)initWithListName:(NSString *)listName{
    if (self = [super init]) {
        _list = listName;
        return self;
    }
    return nil;
    
}

-(NSMutableArray *)listOfTasks{
    if(_listOfTasks == nil){
        _listOfTasks = [[NSMutableArray alloc] init];
    }
    return _listOfTasks;
}

-(void)addTask:(Task *)task{
    [[self listOfTasks] addObject:task];
}



@end
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


@interface Task : NSObject

- (instancetype)initWithTaskName:(NSString *)title;
- (NSString *) getTaskName;

@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Task{
    NSString * _taskName;
}


- (instancetype)initWithTaskName:(NSString *)title{
    if (self = [super init]) {
        _taskName = title;
        return self;
    }
    return nil;
    
}

-(NSString *)getTaskName{
    return _taskName;
}


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@interface Manager : NSObject

-(void)displayTasks:(List *)list;



//-(void)markDone;
//-(void)setPriority:(NSInteger *)i;


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Manager{
    
}

-(void)displayTasks:(List *)list{
    NSMutableArray *myListOfTasks = [list listOfTasks];
    for (int i = 0; i < [myListOfTasks count]; i++) {
        NSLog(@"%@", [myListOfTasks[i] getTaskName]);
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
        
        Task *swim = [[Task alloc] initWithTaskName:@"swim"];
        Task *yoga = [[Task alloc] initWithTaskName:@"yoga"];
        Task *practiceGuitar = [[Task alloc] initWithTaskName:@"practice guitar"];
        
        [toDoToday addTask:swim];
        [toDoToday addTask:yoga];
        [toDoToday addTask:practiceGuitar];
        
        [listManager displayTasks:toDoToday];
        
        
        
        
    }
    return 0;
}


//@end