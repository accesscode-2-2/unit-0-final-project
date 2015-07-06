//
//  main.m
//  3rdRoundTodoList
//
//  Created by Bereket  on 6/29/15.
//  Copyright (c) 2015 Bereket . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

-(void)setPriorityValue:(NSInteger)priorityValue;
- (NSInteger)priorityValue;


-(void)setTask:(NSString *)task;

- (NSString*) itemName ;

-(void)setIsDone:(BOOL)isDone;
-(BOOL)isDone;                              //<-------property will inform us whether task is completed.

@end

@implementation Item {
    NSInteger _priorityValue;
    NSString* _task;
    BOOL _isDone;
}

-(void)setPriorityValue:(NSInteger)priorityValue{
    _priorityValue=priorityValue;
}

-(NSInteger)priorityValue{
    return _priorityValue;
}
-(void)setTask:(NSString *)task{
    _task=task;
}
-(NSString*)itemName{
    return _task;
}

-(void)setIsDone:(BOOL)isDone{
    _isDone=isDone;
}
-(BOOL)isDone{
    return _isDone;
}

@end

//-------------------------------------------------------------------------------------------------------------------------------------//

//-------------------------------------------CLASS THAT DEFINES A LIST----------------------------------------------------------------//

@interface List : NSObject

-(void)setListName:(NSString*)listName;
-(NSString*)listName;
-(void)printListItems;
-(void)addItem;
-(void)addItemWithName:(NSString *)name withPriority:(NSInteger)priority;
-(void)printCompletedItems;
-(void)printIncompletedItems;
-(void)removeItemFromList;
-(void)setlistIsDone:(BOOL)value;
-(BOOL)listIsDone;
-(void)manageList;


@end

@implementation List{
    NSString* _listName;
    NSMutableArray* _listItems;
    BOOL listIsDone;
}

-(void)manageList{
    while (true) {
        
        
        NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
        NSString *inputLine = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSInteger input=[inputLine integerValue];
        
        NSLog(@"What would you like to do? PRESS 1 to show all items\n 2 to add an item\n 3 to set a list as done\n 4 to remove an item\n");
        
        
        switch (input) {
            case 0:
                NSLog(@"NICE JOB ORGANIZING THIS LIST");
                break;
                
            case 1:
                [self printListItems];
                break;
                
            case 2:
                [self addItem];
                break;
                
            case 3:{
                NSLog(@"Pick an item");
                
                char doneList[200];
                scanf("%s",doneList);
                NSString *markedName = [NSString stringWithUTF8String:doneList];
                for(int counter=0; counter< [_listItems count]; counter++){
                    if ([[_listItems[counter] itemName] isEqualToString: markedName]) {
                        [_listItems[counter] setIsDone:YES];
                    }
                }
                break;
            }
                
            case 4:
                [self removeItemFromList];
                break;
                
            default:
                NSLog(@"YO you messed up ma G");
                break;
        }
        
    }
    
    
    
    
}


-(void)addItemWithName:(NSString *)name withPriority:(NSInteger)priority{
    
}


-(void)setListName:(NSString *)listName{
    _listName=listName;
}

-(NSString*)listName{
    return _listName;
}

-(void)printListItems{
    for(int count=0;count<[_listItems count]; count++)
    {
        NSLog(@"%@, %ld", [_listItems[count] itemName],[_listItems[count] priorityValue]);
    }
}

-(void)addItem {           //the AddItem Function will accept two values because the "Item" class has 2 properties
    if (_listItems==nil) {                              //<----this conditional exists because the first time the method is called it wont be able
        _listItems = [[NSMutableArray alloc] init];    //to return an array. Essentially, it says, "If there is no array, make one!"
    }
    
    NSLog(@"What do you want to call this item?");
    
    NSFileHandle *firstInput = [NSFileHandle fileHandleWithStandardInput];
    NSString *name = [[[NSString alloc] initWithData:firstInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSLog(@"What is this items priority?");
    
    NSFileHandle *secondInput = [NSFileHandle fileHandleWithStandardInput];
    NSString *priority = [[[NSString alloc] initWithData:secondInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger priorityIntegerValue = [priority integerValue];
    
    
    Item* newItem= [[Item alloc] init];
    [newItem setTask:name];
    [newItem setPriorityValue:priorityIntegerValue];
    
    [_listItems addObject:newItem];
    
}

-(void)printCompletedItems{
    for(int count=0;count<[_listItems count]; count++)
    {
        if([_listItems[count] isDone]) {                             //BOOLS default to false so it should print out all completed tasks
            NSLog(@"%@, %ld", [_listItems[count] task],(long)[_listItems[count] priorityValue]);
        }//
    }
}

-(void)printIncompletedItems{
    for(int count=0;count<[_listItems count]; count++)
    {
        if(![_listItems[count] isDone]) {                           //Just like in the previous methodsthe "!" tells us if it is not done
            NSLog(@"%@, %ld", [_listItems[count] task],[_listItems[count] priorityValue]);
        }//
    }
}

-(void)removeItemFromList{
    
    NSFileHandle *input = [NSFileHandle fileHandleWithStandardInput];
    NSString *indexString = [[[NSString alloc] initWithData:input.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger index = [indexString integerValue];
    
    [_listItems removeObjectAtIndex:index];
}

-(void)setlistIsDone:(BOOL)value{
    listIsDone=value;
}

-(BOOL)listIsDone{
    return listIsDone;
}

@end

//---------------------------------------------------------------------------------------------------------------------------------------------//

//------------------------------CLASS THAT DEFINES THE TASK MANAGER (or the list of lists)---------------------------------------------------//

//
@interface TaskManager : NSObject
-(void)addList;
-(NSMutableArray*)getLists;
-(void)printLists;
-(void)markListAsDone;
-(void)removeList;
-(void)showCompletedLists;
-(void)showIncompletedLists;
@end

@implementation TaskManager
{
    //char input;
    NSMutableArray* _lists;
    
}
-(void)addList{
    NSLog(@"name your list!");
    
    
    int i=0;
    if (_lists==nil) {  //<--------------------------conditional exists becuase the 1st time addlist is called it wont be able to return one
        _lists = [[NSMutableArray alloc] init];
    }
    
    List* myList=[[List alloc] init];//<-----------called the "List" class to instantiate a list
    char myListName[200];
    scanf("%s",myListName);
    NSString *newListName = [NSString stringWithUTF8String:myListName];
    [myList setListName: newListName];
    [myList setlistIsDone:NO];
    [_lists addObject:myList];//<-------------------------------------The myList array gets stored into _listItems
    
    NSLog(@"set your items in your list!");
    
    while(true)
        
    {
        
        char itemName[256];
        scanf("%s",itemName);
        NSString *myItem = [NSString stringWithUTF8String:itemName]; //<-------scanf cant accept an NSString, so we convert it into "myItem."
        if([myItem isEqual:@"nil"])
        {
            break;
        }
        [myList addItemWithName:myItem withPriority:1];   //<---calls the "myItem" method in the Item class and defaults the priority to 1.
        
        i++;
        
    }
    
    NSLog(@"Good Job!");
    
}

-(NSMutableArray*)getLists{
    return _lists;
}

- (void)printLists{
    for(int counter=0; counter<[_lists count]; counter++){
        NSLog(@"%@", [_lists[counter] listName]);
        
        NSLog(@"Which List do you want to access?");
        
        char doneList[200];
        scanf("%s",doneList);
        NSString *markedName = [NSString stringWithUTF8String:doneList];
        for(int counter=0; counter< [_lists count]; counter++){
            if ([[_lists[counter] listName] isEqualToString: markedName]) {
                [_lists[counter] manageList];
            }
        }
        
        
        
    }
}

-(void)markListAsDone {
    NSLog(@"Enter List name you want to mark as Done!");
    char doneList[200];
    scanf("%s",doneList);
    NSString *markedName = [NSString stringWithUTF8String:doneList];
    for(int counter=0; counter< [_lists count]; counter++){
        if ([[_lists[counter] listName] isEqualToString: markedName]) {
            [_lists[counter] setlistIsDone:YES];
        }
    }
}

-(void)removeList{
    NSLog(@"Enter List you want to remove!");
    char doneList[200];
    scanf("%s",doneList);
    NSString *markedName = [NSString stringWithUTF8String:doneList];
    for(int counter=0; counter< [_lists count]; counter++){
        if ([[_lists[counter] listName] isEqualToString: markedName]){
            [ _lists removeObjectAtIndex:counter];
            counter--;
        }
    }
}

-(void)showCompletedLists{
    for(int counter=0;counter<[_lists count]; counter++)
    {
        if([_lists[counter] listIsDone] == YES) {
            NSLog(@"%@\n", [_lists[counter] listName]);
            
        }
        
    }
}


-(void)showIncompletedLists{
    for(int counter=0;counter<[_lists count]; counter++)
    {
        if([_lists[counter] listIsDone] == NO) {
            NSLog(@"%@", [_lists[counter] listName]);
            
        }
        
    }
}


@end












//-------------------------------------------------------------------------------------------------------------------------------------------//
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        TaskManager* myFirstApp = [[TaskManager alloc] init];
        
        while (true) {
            
            
            
            //            NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
            //            NSString *inputLine = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            //
            //            NSInteger input=[inputLine integerValue];
            
            
            
            NSLog(@"What would you like to do?\n press: \n 1 to add a list\n 2 to remove a list\n 3 to mark a list as done\n 4 to show completed lists\n 5 to show incompleted lists\n 6 to show all lists");
            
            
            NSFileHandle *standardInput = [NSFileHandle fileHandleWithStandardInput];
            NSString *inputLine = [[[NSString alloc] initWithData:standardInput.availableData encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSInteger input=[inputLine integerValue];
            
            switch (input) {
                case 0:
                    NSLog(@"NICE JOB ORGANIZING YOUR LIFE!");
                    break;
                case 1:
                    [myFirstApp addList];
                    break;
                    
                case 2:
                    [myFirstApp removeList];
                    break;
                    
                case 3:
                    [myFirstApp markListAsDone];
                    break;
                    
                case 4:
                    [myFirstApp showCompletedLists];
                    break;
                    
                case 5:
                    [myFirstApp showIncompletedLists];
                    break;
                case 6:
                    [myFirstApp printLists];
                    break;
                default:
                    NSLog(@"YO you messed up ma G");
            }
            
        }
        
        
        
        
        return 0;
    }
}







