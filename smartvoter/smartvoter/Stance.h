//
//  Stance.h
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stance : NSObject

@property (strong, nonatomic) NSString *issue_id;
@property (strong, nonatomic) NSString *candidate;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *quote;
@property (strong, nonatomic) NSString *source;
@property (strong, nonatomic) NSDate *created_at;
@property (strong, nonatomic) NSDate *updated_at;

@end