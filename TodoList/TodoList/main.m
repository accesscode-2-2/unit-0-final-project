//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//
// delete this add
#import <Foundation/Foundation.h>

//@interface toDoList: NSObject
//
//
//
//-(void) enterUserList: (NSMutableArray * )userList;
//-(NSArray *)userList;
//-(void) manageList: (NSArray *)manList;
//-(NSArray *)manList;
//-(void) representList: (NSArray *)repList;
//-(NSArray *)repList;
//-(void) representItem: (NSString *)repItem;
//-(NSString *)repItem;
//
//@end
//
//@implementation toDoList {
//    NSMutableArray *_userList;
//    NSArray *_manList;
//    NSArray *_repList;
//    NSString *_repItem;
//    
//}
//
//-(void) enterUserList: (NSMutableArray *)userList {
//    _userList = userList;
//}
//
//-(void) manageList:(NSArray *)manList {
//    _manList = manList;
//}
//
//-(void) representList: (NSArray *)repList {
//    _repList = repList;
//}
//
//-(void) representItem: (NSString *)repItem {
//    _repItem = repItem;
//}
//
//@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
    printf("To-Do List App\n\n\n");
    
//        char addList, deleteList, editItem, markDone, priority, active,  createList;
        
      
        printf("1) Add Item\n\n2) Delete Item\n\n3) Edit Item\n\n4) Mark Item Done\n\n5) Show Active List\n");
        
        char opt;
        int tasks = 0;
        
        while (tasks <=1000)
        {
            tasks++;
            
            scanf("%c", &opt);
            fpurge(stdin);
            
            if (opt == 'a') {
                
                NSLog(@"What would you like to add?\n", opt);
                
            } else if (opt == 'b') {
                
                NSLog(@"Delete which task?", opt);
                
            } else if (opt == 'c') {
                
                NSLog(@"What would you like to edit?", opt);
                
            } else if (opt == 'd') {
                
                NSLog(@"blank is done", opt);
                
            } else if (opt == 'e') {
                
                NSLog(@"This is your current list: ", opt);
            }
//        for (int tasks = 0; tasks <=4 ; tasks++) {
//
//            scanf("%d", &opt);
//            fpurge(stdin);
//
//            if (opt == 1) {
//
//                NSLog(@"What would you like to add?\n", opt);
//                
//            } else if (opt == 2) {
//            
//                NSLog(@"Delete which task?", opt);
//                
//            } else if (opt == 3) {
//                
//                NSLog(@"What would you like to edit?", opt);
//                
//            } else if (opt == 4) {
//                
//                NSLog(@"blank is done", opt);
//                
//            } else if (opt == 5) {
//                
//                NSLog(@"This is your current list: ", opt);
//            }
         }
    }
    return 0;
}
