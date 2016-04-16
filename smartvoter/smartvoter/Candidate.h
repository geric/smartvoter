//
//  Candidate.h
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Candidate : NSObject

@property (strong, nonatomic) NSString *can_id;
@property (strong, nonatomic) NSString *can_name;
@property (strong, nonatomic) NSString *running_position;
@property int pointsFromVoter;

@end
