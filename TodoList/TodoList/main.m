//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ListManager.h"
#import "List.h"
#import "ListItem.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        printf("Welcome to your To-do List app!");
        printf("\n\n*******************************\n");
        
        
        ListManager *lm = [[ListManager alloc]init];
        
        [lm run];
    }
    return 0;
}
