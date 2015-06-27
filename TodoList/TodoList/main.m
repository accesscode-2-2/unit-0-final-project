//
//  main.m
//  TodoList
//
//  Created by Michael Kavouras on 6/25/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject {
    NSString *xyz;
}

@property (nonatomic) NSString *itemContent;
@property (nonatomic) int *itemPriority;
-(void)setXYZ:(NSString *)value;
-(NSString *)xyz;
@end

//@interface ManageItem : NSObject
//@property (nonatomic) NSString *markItem;
//@property (nonatomic) int priorityItem;
//@property (nonatomic) BOOL markDoneItem;
//@property (nonatomic) NSString *addItem;
//@property (nonatomic) NSString *deletItem;
//
//
//
//@end

@implementation Item

- (void)setXYZ:(NSString *)value {
    _xyx = value;
}


@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // START CODE HERE
        
        Item *aItem = [Item new];
    aItem
        
        // END CODE HERE
    }
    return 0;
}
