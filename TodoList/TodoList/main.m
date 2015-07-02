//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Manager.h"




int main(int argc, const char * argv[]) {
    @autoreleasepool {
 
        Manager *manager = [[Manager alloc] init];
        [manager start];
    }
    return 0;
}
