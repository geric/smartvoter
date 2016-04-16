//
//  Stance.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "Stance.h"

@implementation Stance

- (NSArray *)getAllFromData:(NSData *)data {
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:nil
                                                           error:&error];
    NSMutableArray *allStance = [[NSMutableArray alloc] init];
    
    for(id obj in dict) {
        [allStance addObject:[self convertDictionaryToStance:obj]];
    }
    
    return [allStance copy];
}

- (instancetype)convertDictionaryToStance:(NSDictionary *)dict {
    Stance *stance = [[Stance alloc] init];
    [stance setId:[dict valueForKey:@"id"]];
    [stance setIssue_id:[dict valueForKey:@"issue_id"]];
    [stance setCandidate:[dict valueForKey:@"candidate"]];
    if ([[[dict valueForKey:@"summary"] lowercaseString]  isEqual: @"yes"]) {
        [stance setSummary:SummaryAgree];
    } else if ([[[dict valueForKey:@"summary"] lowercaseString]  isEqual: @"no"]) {
        [stance setSummary:SummaryDisagree];
    } else if ([[[dict valueForKey:@"summary"] lowercaseString]  isEqual: @""]) {
        [stance setSummary:SummaryNoStance];
    }
    [stance setQuote:[dict valueForKey:@"quote"]];
    [stance setSource:[dict valueForKey:@"source"]];
    [stance setCreated_at:[dict valueForKey:@"created_at"]];
    [stance setUpdated_at:[dict valueForKey:@"updated_at"]];
    return stance;
}

@end
