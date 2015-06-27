//
//  ListItem.h
//  TodoList
//
//  Created by Mesfin Bekele Mekonnen on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListItem : NSObject
-(instancetype)initWithDefaultAndName:(NSString *)name;

@property (nonatomic) NSInteger priority;
@property (nonatomic) NSString *itemName;
@property (nonatomic) BOOL completed;
<<<<<<< HEAD

=======
>>>>>>> 543d94c73f2970e5554ee72866a69d4cb1984f95

@end
