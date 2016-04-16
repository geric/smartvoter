//
//  Issue.h
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Issue : NSObject

@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *issue;
@property (strong, nonatomic) NSString *shortname;
@property (strong, nonatomic) NSDate *created_at;
@property (strong, nonatomic) NSDate *updated_at;


- (NSArray *)getAllFromString:(NSString *)jsonString;
- (NSArray *)getAllFromData:(NSData *)jsonString;

@end
