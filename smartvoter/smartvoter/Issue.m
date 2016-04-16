//
//  Issue.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "Issue.h"

@implementation Issue

- (NSArray *)getAllFromString:(NSString *)jsonString {
    NSData* data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:nil
                                                               error:&error];
    NSMutableArray *allIssues = [[NSMutableArray alloc] init];
    
    for(id obj in dict) {
        [allIssues addObject:[self convertDictionaryToIssue:obj]];
    }
    
    return [allIssues copy];
}

- (NSArray *)getAllFromData:(NSData *)data {
    NSError* error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:nil
                                                           error:&error];
    NSMutableArray *allIssues = [[NSMutableArray alloc] init];
    
    for(id obj in dict) {
        [allIssues addObject:[self convertDictionaryToIssue:obj]];
    }
    
    return [allIssues copy];
}


- (instancetype)convertDictionaryToIssue:(NSDictionary *)dict {
    Issue *issue = [[Issue alloc] init];
    [issue setId:[dict valueForKey:@"id"]];
    [issue setIssue:[dict valueForKey:@"issue"]];
    [issue setShortname:[dict valueForKey:@"shortname"]];
    return issue;
//    [issue setId:[dict valueForKey:@"created_at"]];
//    [issue setId:[dict valueForKey:@"updated_at"]];
    
}

@end
