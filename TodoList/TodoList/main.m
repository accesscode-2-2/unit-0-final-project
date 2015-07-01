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



@interface List : NSObject


- (instancetype)initWithListName:(NSString *)listName;

-(NSMutableArray *)listOfTasks;

-(void)addTaskToList:(Task *) task;

-(void)displayTasks:(List *)list;


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



-(void)addTaskToList:(Task *)task{
    [[self listOfTasks] addObject:task];
}


-(void)displayTasks: (List *)list{
    NSMutableArray *tempListOfTasks = [list listOfTasks];
    for (int i = 0; i < [tempListOfTasks count]; i++) {
        NSLog(@"%d %@", i,[tempListOfTasks[i] getTaskName]);
    }
}



@end
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


@interface Manager : NSObject

- (List *)doneTasks;

- (List *)activeTasks;

-(void)deleteTask:(NSInteger)index from: (List *)list;

-(void)markTaskAsDone:(NSInteger)index fromList: (List *)list;


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

@implementation Manager{
    
    List *_doneTasks;
    List *_activeTasks;
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


-(void)deleteTask:(NSInteger)index from: (List *)list {
    
    NSMutableArray *tempArrayOfTasks = [list listOfTasks];
    Task *taskToBeDeleted = [[list listOfTasks] objectAtIndex:index];
    [tempArrayOfTasks removeObjectAtIndex:index];
    
//    [self displayTasks: list];
//    NSLog(@"Which task would you like to remove?");
//    
//    NSString *objectToBeRemoved = scanUserInput();
//    
//    NSMutableArray *myListOfTasks = [list listOfTasks];
//    
//    for (int i = 0; i < [myListOfTasks count]; i++) {
//        
//        if ([objectToBeRemoved isEqualToString: [myListOfTasks[i] getTaskName]]){
//            
//            [list removeObject: myListOfTasks[i]];
//            NSLog(@"Your new list:");
//            [self displayTasks: list];
//            
//        }
//    }
}

-(void)markTaskAsDone:(NSInteger)index fromList:(List *)list{
    
    // take task from active list, hold it in a variable, add to done list
    
    NSMutableArray *tempArrayOfTasks = [list listOfTasks];
    Task *doneTask = [[list listOfTasks] objectAtIndex:index];
    [tempArrayOfTasks removeObjectAtIndex:index];
    [[self doneTasks] addTaskToList:doneTask];
   
}


@end

//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Manager *listManager = [[Manager alloc] init];
        
        List *al = [listManager activeTasks];
        List *dl = [listManager doneTasks];
        
        List *mainFeatures = [[List alloc] init];
        
        Task *add = [[Task alloc] initWithTaskName: @"Add a task to the To Do list"];
        Task *delete = [[Task alloc] initWithTaskName: @"Delete a task from the To Do list"];
        Task *markDone = [[Task alloc] initWithTaskName: @"Mark a task as done"];
        
        [mainFeatures addTaskToList:add];
        [mainFeatures addTaskToList:delete];
        [mainFeatures addTaskToList:markDone];
        
        NSLog(@"Hello!");
//        
//        while (true) {
//            // print list of actions
//            // user selects actions
//            // perform task based on user action
//            
//        }
        
        while (true) {
            
            NSLog(@"What would you like TO DO?");
            
            [mainFeatures displayTasks:mainFeatures];
            
            NSLog(@"Enter a # here:");
            
            NSInteger userInput;
            scanf("%ld", &userInput);
            
            if (userInput == 0){
                
                NSLog(@"Enter the title of the task you'd like to add:");
                
                NSString *newUserTaskTitle = scanUserInput();
                
                Task *newUserTask = [[Task alloc] initWithTaskName: newUserTaskTitle];
                
                [al addTaskToList:newUserTask];
                
                NSLog(@"Your TO DO list:");
                
                [al displayTasks:al];
            }
            
            if (userInput == 1) {
                
                NSLog(@"Enter the # of the task you'd like to delete:");
                
                NSString *newUserInput = scanUserInput();
                NSInteger inputAsInteger = [newUserInput integerValue];
                
                [listManager deleteTask:inputAsInteger from:al];
                
                NSLog(@"Your TO DO list:");
                
                [al displayTasks:al];
                
            }
            
            if (userInput == 2) {
                
                NSLog(@"Your TO DO list:");
                
                [al displayTasks:al];
                
                NSLog(@"Enter the # of the task you'd like to mark DONE:");
                
                NSString *newUserInput = scanUserInput();
                NSInteger inputAsInteger = [newUserInput integerValue];
                
                [listManager markTaskAsDone: inputAsInteger fromList:al];
                
                NSLog(@"Your COMPLETED TASKS list:");
                
                [dl displayTasks:dl];
                
            }
            
//            if (userInput < [mainFeatures count] || userInput > [mainFeatures count]) {
//                NSLog(@"Invalid #. Please try again.");
//            }
            
            
        }
        
//        Task *practiceGuitar = [[Task alloc] initWithTaskName:@"practice guitar"];
//        Task *swim = [[Task alloc] initWithTaskName:@"swim"];
//        Task *yoga = [[Task alloc] initWithTaskName:@"yoga"];
//        
//        
//        [al addTaskToList:practiceGuitar];
//        [al addTaskToList:swim];
//        [al addTaskToList:yoga];
//        
//        
//        
//        [listManager markTaskAsDone:1 fromList:al];
//        [listManager markTaskAsDone:0 fromList:al];
//
//        
//        [al displayTasks:al];
//        [dl displayTasks:dl];
        
    }
    return 0;
}


//@end