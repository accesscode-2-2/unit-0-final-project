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

- (instancetype) initWithName:(NSString *)name{
    
    if(self = [super init]){
        self.listName = name;
        return self;
    }
    return nil;
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
    
    [_items removeObjectAtIndex:index];
}

-(void) markCompleted:(int)index{
   
    ListItem *item = [_items objectAtIndex:index];

    item.completed = YES;
}

-(void) printItems{
    int i =1;
    for(ListItem *li in _items){
        printf("%d. %s\n",i,[li.itemName UTF8String]);
        i++;
    }
    printf("\n");
}

-(void) setPriority:(int)index{
    int newValue;

    printf("Enter a priority value, 1-4: ");
    scanf("%d",&newValue);
    fpurge(stdin);

    ListItem *li = [_items objectAtIndex:index];
    li.priority = newValue;
}

-(void) editItem:(int)index{
    char newName [256];
    printf("New description: ");
    scanf("%255[^\n]%*c",newName);
    fpurge(stdin);
    ListItem *li = [_items objectAtIndex:index];
    li.itemName = [NSString stringWithCString:newName encoding:NSASCIIStringEncoding];
}


-(void) active{
    int i = 1;
    printf("\n");
    for(ListItem * li in _items){
        if(!li.completed){
            printf("%d. %s\n",i, [li.itemName UTF8String]);
            i++;
        }
    }
    while(YES){
        char exitKey[256];
        printf("To exit press q: ");
        scanf("%255[^\n]%*c",exitKey);
        NSString *c = [NSString stringWithCString:exitKey encoding:NSASCIIStringEncoding];
        if ([c isEqualToString:@"q"] || [c isEqualToString:@"Q"]){
            printf("\n\n\n");
            break;
        }
    }
}

-(void) inActive{
    int i = 1;
    printf("\n");
    for(ListItem * li in _items){
        if(li.completed){
            printf("%d. %s\n",i, [li.itemName UTF8String]);
            i++;
        }
    }
    while(YES){
        char exitKey[256];
        printf("To exit press q: ");
        scanf("%255[^\n]%*c",exitKey);
        NSString *c = [NSString stringWithCString:exitKey encoding:NSASCIIStringEncoding];
        if ([c isEqualToString:@"q"] || [c isEqualToString:@"Q"]){
            printf("\n\n\n");
            break;
        }
    }
}

-(void) run{
    while(YES){
        char holder[256];
        [self printItems];
        [self printCommands];
        printf("\n:");
        scanf("%255[^\n]%*c",holder);
        fpurge(stdin);
    
        NSString *checker = [NSString stringWithCString:holder encoding:NSASCIIStringEncoding];
        
        if([checker isEqualToString:@"e"] || [checker isEqualToString:@"E"]){
            int d;
            printf("\nIndex number? ");
            scanf("%d",&d);
            fpurge(stdin);
            printf("\n");
            NSInteger arraySize = [_items count];
            if(d < 1 || d > arraySize){
                NSString *c = [NSString stringWithFormat:@"%@",d<1? @"Must be greater than or equal to 1\n":@"out of bounds\n"];
                printf("%s",[c UTF8String]);
                continue;
            }
            [self editItem:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"d"] || [checker isEqualToString:@"D"]){
            int d;
            printf("\nIndex number? ");
            scanf("%d",&d);
            fpurge(stdin);
            printf("\n");
            NSInteger arraySize = [_items count];
            if(d < 1 || d > arraySize){
                NSString *c = [NSString stringWithFormat:@"%@",d<1? @"Must be greater than or equal to 1\n":@"out of bounds\n"];
                printf("%s",[c UTF8String]);
                continue;
            }
            [self deleteItem:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"c"] || [checker isEqualToString:@"C"]){
            int d;
            printf("\nIndex number? ");
            scanf("%d",&d);
            fpurge(stdin);
            printf("\n");
            NSInteger arraySize = [_items count];
            if(d < 1 || d > arraySize){
                NSString *c = [NSString stringWithFormat:@"%@",d<1? @"Must be greater than or equal to 1\n":@"out of bounds\n"];
                printf("%s",[c UTF8String]);
                continue;
            }
            [self markCompleted:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"p"] || [checker isEqualToString:@"P"]){
            int d;
            printf("\nIndex number? ");
            scanf("%d",&d);
            fpurge(stdin);
            NSInteger arraySize = [_items count];
            if(d < 1 || d > arraySize){
                NSString *c = [NSString stringWithFormat:@"%@",d<1? @"Must be greater than or equal to 1\n":@"out of bounds\n"];
                printf("%s",[c UTF8String]);
                continue;
            }
            
            [self setPriority:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"a"] || [checker isEqualToString:@"A"]){
            
            [self addItem];
            continue;
        }
        
        if([checker isEqualToString:@"t"] || [checker isEqualToString:@"T"]){
            
            [self active];
            continue;
        }
        
        if([checker isEqualToString:@"i"] || [checker isEqualToString:@"I"]){
            
            [self inActive];
            continue;
        }
        
        if([checker isEqualToString:@"q"] || [checker isEqualToString:@"Q"]){
            printf("\n\n\n");
            break;
        }
        
    }
}

-(void) printCommands{
    printf("a|add               e|edit\n");
    printf("d|delete            p|set priority\n");
    printf("c|mark completed    t|active\n");
    printf("i|inactive          q|quit\n");
}
@end
