//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString * scanUserInput(void) {
    NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
    NSString *userInput = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return userInput;
}

@class List;
@class Task;
@class Manager;


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@interface List : NSObject


- (instancetype)initWithListName:(NSString *)listName;

-(NSMutableArray *)listOfTasks;
-(NSMutableArray *)listOfDoneTasks;

-(void)addTask:(Task *) task;
-(void)addTaskToDoneTasks:(Task *)task;

-(void)removeObject:(NSString *)object;




@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation List{
    NSString* _list;
    NSMutableArray* _listOfTasks;
    NSMutableArray* _listOfDoneTasks;
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

-(NSMutableArray *)listOfDoneTasks{
    if(_listOfDoneTasks == nil){
        _listOfDoneTasks = [[NSMutableArray alloc] init];
    }
    return _listOfDoneTasks;
}

-(void)addTask:(Task *)task{
    [[self listOfTasks] addObject:task];
}

-(void)addTaskToDoneTasks:(Task *)task{
    [[self listOfDoneTasks] addObject:task];
}

-(void)removeObject:(NSString *)object{
    [[self listOfTasks] removeObject:object];
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

-(List *) createNewList;

-(Task *) createNewTask;

-(void)displayTasks:(List *)list;

-(void)removeTask:(List *)list;

-(void)markTaskAsDone:(List *)list;


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Manager{
    
}

-(List *) createNewList: (NSString *)name{
    List *newList = [[List alloc] initWithListName:name];
    return newList;
}


-(Task *) createNewTask: (NSString *)name{
    Task *newTask = [[Task alloc] initWithTaskName:name];
    return newTask;
}


-(void)displayTasks:(List *)list{
    NSMutableArray *myListOfTasks = [list listOfTasks];
    for (int i = 0; i < [myListOfTasks count]; i++) {
        NSLog(@"%@", [myListOfTasks[i] getTaskName]);
    }
}


-(void)removeTask:(List *)list {
    
    [self displayTasks: list];
    NSLog(@"Which task would you like to remove?");
    
    NSString *objectToBeRemoved = scanUserInput();
    
    NSMutableArray *myListOfTasks = [list listOfTasks];
    
    for (int i = 0; i < [myListOfTasks count]; i++) {
        
        if ([objectToBeRemoved isEqualToString: [myListOfTasks[i] getTaskName]]){
            
            [list removeObject: myListOfTasks[i]];
            NSLog(@"Your new list:");
            [self displayTasks: list];
            
        }
    }
}

-(void)markTaskAsDone:(List *)list{
    
    [self displayTasks: list];
    NSLog(@"Which task would you like to mark as 'Done'?");
    
    NSString *objectToBeMarkedAsDone = scanUserInput();
    
    NSMutableArray *myListOfTasks = [list listOfTasks];
    
    for (int i = 0; i < [myListOfTasks count]; i++) {
        
        if ([objectToBeMarkedAsDone isEqualToString: [myListOfTasks[i] getTaskName]]){
            
            List *doneAndDone = [self createNewList:@"Done and Done"];
            Task *newDoneTask = [self createNewTask:objectToBeMarkedAsDone];
            [doneAndDone addTask:newDoneTask];
            
            NSLog(@"Completed tasks:");
            [self displayTasks:doneAndDone];
            
            [list removeObject: myListOfTasks[i]];
            NSLog(@"Your new list:");
            [self displayTasks: list];
            
        }
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
        //List *doneAndDone = [[List alloc] initWithListName:@"Done and Done"];
        
        Task *practiceGuitar = [[Task alloc] initWithTaskName:@"practice guitar"];
        Task *swim = [[Task alloc] initWithTaskName:@"swim"];
        Task *yoga = [[Task alloc] initWithTaskName:@"yoga"];
        
        [toDoToday addTask:practiceGuitar];
        [toDoToday addTask:swim];
        [toDoToday addTask:yoga];
        
        //[listManager displayTasks:toDoToday];
        
        //[listManager removeTask:toDoToday];
        
        [listManager markTaskAsDone:toDoToday];
        
        [listManager markTaskAsDone:toDoToday];
        
        
        
    }
    return 0;
}


//@end