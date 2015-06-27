//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoListApp : NSObject

@property NSMutableArray *_listMenu;

@end

@implementation ToDoListApp {
    
}

-(void)addList:(NSMutableArray *)addList; {// adds list to ToDoListApp
}

-(void)removeList:(NSMutableArray *)removeList; {// removes list from ToDoListApp
}

-(void)completedLists:(NSMutableArray *)completedList; {// prints completed list to ToDoListApp
}

-(void) printList:(NSMutableArray *)printList; {// adds list to ToDoListApp
}


@end



@interface list: NSObject

@property NSMutableArray *_listItem;
@property NSString *_name;

@end


@implementation list {
    
    
    for(int i=0;i<=[listItem count];i++)
    {
        listItem[i]= [[item alloc] init];
         scanf("%@",&ListItem[i])
    }
    
    
}

-(void)addItem:(NSMutableArray *)addList {
    

    char word;
    scanf("%s", &word);
    NSString *_newItem = [NSString stringWithUTF8String:&word];
    
    [__listItem addObject:_newItem];
    
    
}

-(void)removeItem:(NSMutableArray *)removeListItem; {
}

-(void)listCompletedItems:(NSMutableArray *)completedListItem; {
}

-(void)markItemDone :(NSMutableArray *)printListItem; {
}

-(void)priorityValueForItem :(NSMutableArray *)priorityValueItem; {
    
    for (int counter=0; counter<=[__listItem count]; counter++) {
        scanf("%d",__listItem[counter]);
        
    }

    
}
-(void)printAllItems:(NSMutableArray *)entirelist; {
    
    for (int counter=0; counter<=[__listItem count]; counter++) {
        NSLog(@"%@",__listItem[counter]);
    }
}

@end

@interface item: NSObject

@property int priority;
@property NSString *task;

@end

@implementation item {
    
    
}
@end




int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        

        
        
    }
    return 0;
}
