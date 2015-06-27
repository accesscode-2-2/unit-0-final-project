//
//  List.m
//  TodoList
//
//  Created by Mesfin Bekele Mekonnen on 6/27/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "List.h"
#import "ListItem.h"

@implementation List {
    NSMutableArray *_items;
}

-(void) addItem{
    
    if(_items == nil){
        _items = [[NSMutableArray alloc]init];
    }
    char temp[256];
    printf("\n Add description: ");
    scanf("%255[^\n]%*c",temp);
    fpurge(stdin);
    NSString *name = [NSString stringWithCString:temp encoding:NSASCIIStringEncoding];
    ListItem *li = [[ListItem alloc] initWithDefaultAndName:name];
    
    [_items addObject:li];
}

-(void) deleteItem:(int)index{
    NSInteger arraySize = [_items count];
    if(index < 1 || index > arraySize){
        NSString *c = [NSString stringWithFormat:@"%@",index<1? @"Must be greater than or equal to 1":@"out of bounds"];
        printf("%s",[c UTF8String]);
        return;
    }
    [_items removeObjectAtIndex:index];
    
}

-(void) markCompleted:(int)index{
    NSInteger arraySize = [_items count];
    if(index < 1 || index > arraySize){
        NSString *c = [NSString stringWithFormat:@"%@",index<1? @"Must be greater than or equal to 1":@"out of bounds"];
        printf("%s",[c UTF8String]);
        return;
    }

    ListItem *item = [_items objectAtIndex:index-1];
    item.completed = YES;
}

-(void) printItems{
        int i =1;
        for(ListItem *li in _items){
            printf("%d. %s\n",i,[li.itemName UTF8String]);
            i++;
        }
    }

-(void) setPriority:(int)index{
    NSInteger arraySize = [_items count];
    if(index <1 || index >arraySize){
        NSString *c = [NSString stringWithFormat:@"%@",index<1? @"Must be greater than or equal to 1":@"Highest priority level is 4."];
        printf("%s",[c UTF8String]);
        return;
    }
    int newValue;
    printf("Enter a priorty value, 1-4");
    scanf("%d",&newValue);
    ListItem *li = [_items objectAtIndex:index - 1];
    li.priority = newValue;
}

-(void) editItem:(int)index{
    char newName [256];
    printf("New description: ");
    scanf("%255[^\n]%*c",newName);
    fpurge(stdin);
    ListItem *li = [_items objectAtIndex:index-1];
    li.itemName = [NSString stringWithCString:newName encoding:NSASCIIStringEncoding];
}

-(void) active{
    int i = 1;
    printf("\n");
    for(ListItem * li in _items){
        if(!li.completed){
            printf("%d. %s\n",i, [li.itemName UTF8String]);
        }
    }
}

-(void) inActive{
    int i = 1;
    printf("\n");
    for(ListItem * li in _items){
        if(li.completed){
            printf("%d. %s\n",i, [li.itemName UTF8String]);
        }
    }
}

-(void) run{
    while(YES){
        char holder[256];
        [self printItems];
        //[self printCommandActive:..:inactive
        scanf("%255[^\n]%*c",holder);
        NSString *checker = [NSString stringWithCString:holder encoding:NSASCIIStringEncoding];
        if([checker isEqualToString:@"e"] || [checker isEqualToString:@"E"]){
            
        }
    }
}

-(void) printCommands{
        printf("a|add               e|edit\n");
        printf("d|delete            p|set priority\n");
        printf("c|mark completed    a|active\n");
        printf("i|inactive");
}
@end
