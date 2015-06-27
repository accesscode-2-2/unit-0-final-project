//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

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
        NSLog(@"Good Morning, what are you going to do today?");
        
        scanf(@"%@, %@, %@, %@\n", &item1, &item2, &item, &item4);
        *charlesList = [Charles userList:[NSMutableArray arrayWithObjects:@"item1", @"item2", @"item3", @"item4", nil]];
        
        
        
        

    }
    return 0;
}
