//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
// delete this add
#import <Foundation/Foundation.h>

@interface toDoList: NSObject

-(void) enterUserList: (NSMutableArray * )userList;
-(NSArray *)userList;
-(void) manageList: (NSArray *)manList;
-(NSArray *)manList;
-(void) representList: (NSArray *)repList;
-(NSArray *)repList;
-(void) representItem: (NSString *)repItem;
-(NSString *)repItem;

@end

@implementation toDoList {
    NSMutableArray *_userList;
    NSArray *_manList;
    NSArray *_repList;
    NSString *_repItem;
    
}

-(void) enterUserList: (NSMutableArray *)userList {
    _userList = userList;
}

-(void) manageList:(NSArray *)manList {
    _manList = manList;
}

-(void) representList: (NSArray *)repList {
    _repList = repList;
}

-(void) representItem: (NSString *)repItem {
    _repItem = repItem;
}




@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        toDoList *Charles = [[toDoList alloc]init];
        NSMutableArray *charlesList = [[NSMutableArray alloc]init];
        int laundry;
        int homework;
        int shopping;
        int exercise;
        int chore;
        
        NSLog(@"Good morning, what are you going to do today?\n 1) Laundry\n 2) Homework\n 3) Shopping\n 4) Exercise\n");
        
        
        
        for (int tasks; tasks <=4 ; tasks++) {
            scanf("%d", &chore);
            if (chore == 1) {
                NSLog(@"Choose another chore\n", chore);
            } else if (chore == 2) {
                NSLog(@"You need to do more! Choose another one!", chore);
            } else if (chore == 3) {
                NSLog(@"Anything else?", chore);
            } else if (chore == 4) {
                NSLog(@"Great, now we're set for the day", chore);
            }

        
        

        
        
        
        
        
    }
    return 0;
}
}
