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
    li.idNumber=self.id;
    self.id+=1;
    [_items addObject:li];
}

-(void) deleteItem:(int)index{
    
    [_items removeObjectAtIndex:index];
}

-(void) markCompleted:(int)index{
    
    ListItem *item = [_items objectAtIndex:index];
    
    item.completed = YES;
}

-(void) setDate:(int)index{
    ListItem *item = [_items objectAtIndex:index];
    
    
    
    char array[256];
    printf("Enter date mm/dd/yyyy: ");
    scanf("%255[^\n]%*c",array);
    fpurge(stdin);
    
    NSString *info = [NSString stringWithCString:array encoding:NSASCIIStringEncoding];
    for(int i = 0; i < [info length]; i++){
        if((!isdigit([info characterAtIndex:i])&& [info characterAtIndex:i]!='/') ||(ispunct([info characterAtIndex:i]) && [info characterAtIndex:i]!='/')){
            printf("\nInvalid date!\n");
            return;
        }
    }
    NSArray *parts = [info componentsSeparatedByString:@"/"];
    
    NSDateComponents *c = [[NSDateComponents alloc]init];
    
    int a = [parts[0] intValue];
    int b = [parts[1] intValue];
    int d = [parts[2] intValue];
    
    if((a<1 || a>12) || (b<1 || b>31) || (d<0) || (a==2 && b>28 && d%4!=0) || (a==2 && b>29 && d%4==0) || ((a==4||a==6||a==9||a==11) && b>30) || [parts count]!=3){
        printf("\nInvalid Date!\n");
        return;
    }
    
    [c setDay:b];
    [c setMonth:a];
    [c setYear:d];
    
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate *date = [calendar dateFromComponents:c];
    item.date = date;
    item.hasDate = YES;
}

-(void) printItems{
    NSSortDescriptor *sortingMethod = [[NSSortDescriptor alloc] initWithKey:@"idNumber" ascending:YES];
    
    [_items sortUsingDescriptors:@[sortingMethod]];
    int i =1;
    for(ListItem *li in _items){
        printf("%d. %s\n",i,[li.itemName UTF8String]);
        i++;
    }
    printf("\n");
}
-(void) printItemsByPriority{
    int i=1;
    char *p1 = "   *";
    char *p2 = "  **";
    char *p3 = " ***";
    char *p4 = "****";
    
    NSSortDescriptor *sortingMethod = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:NO];
    
    [_items sortUsingDescriptors:@[sortingMethod]];
    
    for (ListItem *li in _items) {
        if(li.priority == 1){
            printf("%d. %s %s\n",i,p1,[li.itemName UTF8String]);
        }
        if (li.priority == 2) {
            printf("%d. %s %s\n",i,p2,[li.itemName UTF8String]);
        }
        if (li.priority == 3) {
            printf("%d. %s %s\n",i,p3,[li.itemName UTF8String]);
        }
        if (li.priority == 4) {
            printf("%d. %s %s\n",i,p4,[li.itemName UTF8String]);
        }
        i++;
    }
    printf("\n");
}

-(void) printByDueDate{
    int i =1;
    NSSortDescriptor *sortingMethod = [[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES];
    
    [_items sortUsingDescriptors:@[sortingMethod]];
    for(ListItem *li in _items){
        if(li.hasDate){
            unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
            NSCalendar *gregorian = [NSCalendar currentCalendar];
            NSDateComponents *component = [gregorian components:unitFlags fromDate:li.date];
            printf("%d. %s | %d/%d/%d\n",i,[li.itemName UTF8String],(int)[component month], (int)[component day], (int)[component year]);
        }
        else{
            printf("%d. %s\n",i,[li.itemName UTF8String]);
        }
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
        fpurge(stdin);
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
        char exitKey[1];
        printf("To exit press q: ");
        scanf("%1[^\n]%*c",exitKey);
        fpurge(stdin);
        NSString *c = [NSString stringWithCString:exitKey encoding:NSASCIIStringEncoding];
        if ([c isEqualToString:@"q"] || [c isEqualToString:@"Q"]){
            printf("\n\n\n");
            break;
        }
    }
}

-(BOOL) outOfBounds:(int)index{
    NSInteger arraySize = [_items count];
    if(index < 1 || index > arraySize){
        NSString *c = [NSString stringWithFormat:@"%@",index<1? @"Must be greater than or equal to 1\n":@"out of bounds\n"];
        printf("%s",[c UTF8String]);
        return YES;
    }
    return NO;
}

-(int) getIndex{
    int d;
    printf("\nIndex number? ");
    scanf("%d",&d);
    fpurge(stdin);
    printf("\n");
    return d;
}

-(void) run{
    while(YES){
        char holder[256];
        if (self.viewPriority == NO && self.viewByDueDate == NO){
            [self printItems];
        }
        if(self.viewPriority){
            [self printItemsByPriority];
        }
        if(self.viewByDueDate){
            [self printByDueDate];
        }
        [self printCommands];
        printf("\n:");
        scanf("%255[^\n]%*c",holder);
        fpurge(stdin);
        printf("\n");
        
        NSString *checker = [NSString stringWithCString:holder encoding:NSASCIIStringEncoding];
        
        if([checker isEqualToString:@"e"] || [checker isEqualToString:@"E"]){
            int d = [self getIndex];
            
            if([self outOfBounds:d]){
                continue;
            }
            
            [self editItem:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"d"] || [checker isEqualToString:@"D"]){
            int d = [self getIndex];
            
            if([self outOfBounds:d]){
                continue;
            }
            [self deleteItem:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"c"] || [checker isEqualToString:@"C"]){
            int d = [self getIndex];
            
            if([self outOfBounds:d]){
                continue;
            }
            [self markCompleted:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"sd"] || [checker isEqualToString:@"SD"]){
            int d = [self getIndex];
            
            if([self outOfBounds:d]){
                continue;
            }
            [self setDate:d-1];
            continue;
        }
        
        if([checker isEqualToString:@"p"] || [checker isEqualToString:@"P"]){
            int d = [self getIndex];
            
            if([self outOfBounds:d]){
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
        if([checker isEqualToString:@"vp"] || [checker isEqualToString:@"VP"]){
            if(self.viewPriority){
                self.viewPriority=NO;
            }
            else{
                self.viewByDueDate = NO;
                self.viewPriority = YES;
            }
            continue;
        }
        if([checker isEqualToString:@"vd"] || [checker isEqualToString:@"VD"]){
            if(self.viewByDueDate){
                
                self.viewByDueDate=NO;
            }
            else{
                self.viewByDueDate = YES;
                self.viewPriority=NO;
            }
            continue;
        }
        
    }
}

-(void) printCommands{
    printf(" a|add               e|edit            sd|set due date\n");
    printf(" d|delete            p|set priority     c|mark completed\n");
    printf(" t|active            i|inactive         q|quit\n");
    printf("vp|View by priority(ON/OFF)            vd|View by date(ON/OFF)\n");
    printf("\n\n\n\n\n\n\n\n\n");
    
}
@end
