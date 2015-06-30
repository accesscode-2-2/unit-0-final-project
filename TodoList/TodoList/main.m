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


-(void)addTask:(Task *) task;


-(void)removeObject:(NSString *)object;




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

- (List *)doneTasks;

- (List *)activeTasks;

-(NSMutableArray *)listOfDoneTasks;

-(Task *) createCompletedTask: (NSString *)name;

-(void)addTaskToDoneTasks:(Task *)task;

-(void)displayTasks:(List *)list;

-(void)removeTask:(List *)list;

-(void)markTaskAsDone:(NSInteger *)index fromList: (List *)list;


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Manager{
    NSMutableArray* _listOfDoneTasks;
    List *_doneTasks;
    List *_activeTasks;
    Task *_completedTask;
}


- (List *)doneTasks {
    // if it is nil create it
    if (_doneTasks == nil) {
        _doneTasks = [[List alloc] initWithListName:@"Done and Done"];
    }
    return _doneTasks;
}

- (List *)activeTasks {
    // if it is nil create it
    if (_activeTasks == nil) {
        _activeTasks = [[List alloc] initWithListName:@"To Do Today"];
    }
    return _activeTasks;
}


-(Task *) createCompletedTask: (NSString *)name{
    Task *completedTask = [[Task alloc] initWithTaskName:name];
    return completedTask;
}

-(NSMutableArray *)listOfDoneTasks{
    if(_listOfDoneTasks == nil){
        _listOfDoneTasks = [[NSMutableArray alloc] init];
    }
    return _listOfDoneTasks;
}

-(void)addTaskToDoneTasks:(Task *)task{
    [[self listOfDoneTasks] addObject:task];
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

-(void)markTaskAsDone:(NSInteger *)index fromList:(List *)list{
    
    // take task from active list, hold it in a variable, add to done list
    
    NSMutableArray *tempList = [list listOfTasks];
    Task *foundTask = [[list listOfTasks] objectAtIndex:index];
    [tempList removeObjectAtIndex:index];
    [[self doneTasks] addTask:foundTask];
    //[[_doneTasks listOfTasks] addObject:foundTask];
    
    
//    [self displayTasks: list];
//    NSLog(@"Which task would you like to mark as 'Done'?");
//    
//    NSString *objectToBeMarkedAsDone = scanUserInput();
//    
//    NSMutableArray *myListOfTasks = [list listOfTasks];
//    
//    for (int i = 0; i < [myListOfTasks count]; i++) {
//        
//        if ([objectToBeMarkedAsDone isEqualToString: [myListOfTasks[i] getTaskName]]){
//            
//            _completedTask = [self createCompletedTask:objectToBeMarkedAsDone];
//            [self addTaskToDoneTasks: _completedTask];
//            
////            List *doneAndDone = [self _completedTasks];
////            Task *newDoneTask = [self createNewTask:objectToBeMarkedAsDone];
////            [doneAndDone addTask:newDoneTask];
//            
//            NSLog(@"Completed tasks:");
//            [self displayTasks:_listOfDoneTasks];
//            
//            [list removeObject: myListOfTasks[i]];
//            NSLog(@"Your new list:");
//            [self displayTasks: list];
//            
//        }
//    }
}


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Manager *listManager = [[Manager alloc] init];
//        
//        while (true) {
//            // print list of actions
//            // user selects actions
//            // perform task based on user action
//            
//        }
        
        Task *practiceGuitar = [[Task alloc] initWithTaskName:@"practice guitar"];
        Task *swim = [[Task alloc] initWithTaskName:@"swim"];
        Task *yoga = [[Task alloc] initWithTaskName:@"yoga"];
        
        List *al = [listManager activeTasks];
        [al addTask:practiceGuitar];
        [al addTask:swim];
        [al addTask:yoga];
        
        //[listManager displayTasks:toDoToday];
        
        //[listManager removeTask:toDoToday];
        
        [listManager markTaskAsDone:1 fromList:al];
        [listManager markTaskAsDone:0 fromList:al];
//        [listManager markTaskAsDone:toDoToday];
//        
//        [listManager markTaskAsDone:toDoToday];
        
        NSLog(@"whatever");
        
    }
    return 0;
}


//@end