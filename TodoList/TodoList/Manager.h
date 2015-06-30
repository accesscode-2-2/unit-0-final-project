//
//  Manager.h
//  TodoList
//
//  Created by Jason Wang on 6/30/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Manager : NSObject

@property (nonatomic) NSMutableArray *lists;

+(NSString *)getInputString;
+(void)printString:(NSString *)string;

-(void)showMenu;

@end
