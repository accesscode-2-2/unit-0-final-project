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
        
    printf("To-Do List App\n\n\n");
    
        char addList, deleteList, editItem, markDone, priority, active, inactive, createList;
        int opt1, opt2, opt3, opt4, opt5, opt6;
      
        printf("\n1) Add Item\n2) Delete Item\n3) Edit Item\n4) Mark Done\n5) Active \n6) Inactive");
        scanf("%s", &createList);
        for (int options = 0; options <=6; options++) {
            scanf("%d", &opt1
        }
        
        
        
      
    }
    return 0;
}
