//
//  RankingViewController.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "RankingViewController.h"
#import "Candidate.h"

@implementation RankingViewController

//@synthesize candidatesRanking;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lblRanking = [self.view viewWithTag:4444];
    [lblRanking setLineBreakMode:NSLineBreakByWordWrapping];
    [lblRanking setNumberOfLines:0];
    
    NSString *newString;
    for (int i = 0; i < self.candidatesRanking.count; i++) {
        Candidate *candidate = (Candidate *)[self.candidatesRanking objectAtIndex:i];
        newString = [NSString stringWithFormat:@"%i\n",candidate.pointsFromVoter];
        NSLog(@"Candidates points %i", candidate.pointsFromVoter);
    }
    [lblRanking setText:newString];
}

@end
