//
//  ProfileViewController.m
//  smartvoter
//
//  Created by geric encarnacion on 17/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "ProfileViewController.h"

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [self.view viewWithTag:313131];
    NSString *imageName = [NSString stringWithFormat:@"%@.jpg", self.selectedCandidate.can_id];
    NSLog(@">>>>>>>>>>>>>>>>>>>>> %@",imageName);
    [imageView setImage:[UIImage imageNamed:imageName]];
    
    NSLog(@">>>>>>>>>>>>>>>>>>>>> %@",self.selectedCandidate.can_color);
    
    UIView *view = [self.view viewWithTag:777];
    [view setBackgroundColor:self.selectedCandidate.can_color];
    
    UILabel *nameLabel = [self.view viewWithTag:11];
    [nameLabel setText:self.selectedCandidate.can_name];

    
}

@end
