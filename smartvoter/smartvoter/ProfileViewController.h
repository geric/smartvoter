//
//  ProfileViewController.h
//  smartvoter
//
//  Created by geric encarnacion on 17/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Candidate.h"

@interface ProfileViewController : UIViewController

@property (nonatomic, strong) Candidate *selectedCandidate;

@end
