//
//  Entry.m
//  DayX
//
//  Created by Duc Ho on 1/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString *entryListKey = @"entries";

@implementation Entry

-(id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init]; //ask question for this
    if (self) {
        self.title = dictionary[titleKey];
        self.text = dictionary[textKey];
        self.timeStamp = dictionary[timeStampKey];
    }
    
    return self;
}

-(NSDictionary *)entryDictionary {
    NSMutableDictionary *entryDict = [NSMutableDictionary new];
    if (self.title) {
        [entryDict setValue:self.title forKey:titleKey];
    }
    if (self.text) {
        [entryDict setValue:self.text forKey:textKey];
    }
    if (self.timeStamp) {
        [entryDict setValue:self.timeStamp forKey:timeStampKey];
    }
    
    return entryDict;
}

+(NSMutableArray *)loadEntriesFromDefaults {
    NSArray *entryDictionaries = [[NSUserDefaults standardUserDefaults] objectForKey:entryListKey];
    NSMutableArray *entries = [NSMutableArray new];
    
    for (NSDictionary *entryDictionary in entryDictionaries) {
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [entries addObject:entry];
    }
    
    return entries;
}

+(void)storeEntriesInDefaults:(NSArray *)entries {
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    for (Entry *entry in entries) {
        [entryDictionaries addObject:[entry entryDictionary]];
    }
         
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entryListKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


@end
