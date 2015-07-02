//
//  main.m
//  Natalias_ToDo
//
//  Created by Natalia Estrella on 6/28/15.
//  Copyright (c) 2015 Natalia Estrella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Manager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Manager *manager = [[Manager alloc] init];
        [manager showMenu];
    }
    return 0;
}
