//
//  Entry.h
//  DayX
//
//  Created by Duc Ho on 1/17/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *titleKey = @"title";
static NSString *textKey = @"text";
static NSString *timeStampKey = @"timestamp";

@interface Entry : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timeStamp;

-(id)initWithDictionary:(NSDictionary *)dictionary;
-(NSDictionary *)entryDictionary;
+(NSMutableArray *)loadEntriesFromDefaults;
+(void)storeEntriesInDefaults:(NSArray *)entries;

@end
