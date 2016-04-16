//
//  DecisionViewController.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "DecisionViewController.h"
#import "Issue.h"
#import "Stance.h"

int issueCounter;
NSArray *issues;
UILabel *lblIssue;

int binay;
int duterte;
int defensorSantiago;
int poe;
int roxas;

NSMutableArray *globalVoterStance;

@implementation DecisionViewController

//TODO: enum of answer
//TODO: 0 = No Stance, 1 = NO, 2 = YES

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    globalVoterStance = @[
//                    @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree),
//                    @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree),
//                    @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree)
//                ];
    globalVoterStance = [[NSMutableArray alloc] init];
    
    
    issueCounter = 0;
    
    lblIssue = [self.view viewWithTag:111];
    [lblIssue setLineBreakMode:NSLineBreakByWordWrapping];
    [lblIssue setNumberOfLines:0];
    UIButton *btnAgree = [self.view viewWithTag:1111];
    UIButton *btnNoStance = [self.view viewWithTag:2222];
    UIButton *btnDisagree = [self.view viewWithTag:3333];
    
    [btnAgree addTarget:self action:@selector(btnAgree:) forControlEvents:UIControlEventTouchUpInside];
    [btnNoStance addTarget:self action:@selector(btnNoStance:) forControlEvents:UIControlEventTouchUpInside];
    [btnDisagree addTarget:self action:@selector(btnDisagree:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"allIssues" ofType:@"json"];
    NSData *issueData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    issues = [[[Issue alloc] init] getAllFromData:issueData];
    
    Issue *is = [issues objectAtIndex:0];
    [lblIssue setText:is.issue];
}

- (void)btnAgree:(id)obj {
    [globalVoterStance addObject:@(SummaryAgree)];
    [self nextQuestion];
}

- (void)btnNoStance:(id)obj {
    [globalVoterStance addObject:@(SummaryNoStance)];
    [self nextQuestion];
}

- (void)btnDisagree:(id)obj {
    [globalVoterStance addObject:@(SummaryDisagree)];
    [self nextQuestion];
}

- (void)nextQuestion {
    issueCounter++;
    if (issueCounter < issues.count) {
        [lblIssue setText:[[issues objectAtIndex:issueCounter] issue]];
    } else {
        NSLog(@">>>>>>>>>> EVALUATE %i", issueCounter);
        
        
        NSArray *binayStance = [self getStanceArrayForPath:@"president/1binayStance"];
        NSArray *santiagoStance = [self getStanceArrayForPath:@"president/2santiagoStance"];
        NSArray *duterteStance = [self getStanceArrayForPath:@"president/3duterteStance"];
        NSArray *poeStance = [self getStanceArrayForPath:@"president/4poeStance"];
        NSArray *roxasStance = [self getStanceArrayForPath:@"president/5roxasStance"];
        
        int binayPoints = [self matchYourStance:[globalVoterStance copy] ToCandidateStance:binayStance];
        NSLog(@">>>>>>>>>>>>>>>>>> binay %i", binayPoints);
        
        int santiagoPoints = [self matchYourStance:[globalVoterStance copy] ToCandidateStance:santiagoStance];
        NSLog(@">>>>>>>>>>>>>>>>>> santiago %i", santiagoPoints);
//
//        int dp = [self matchYourStance:globalVoterStance ToCandidateStance:duterteStance];
//        NSLog(@">>>>>>>>>>>>>>>>>> duterte %i", dp);
//        
//        int pp = [self matchYourStance:globalVoterStance ToCandidateStance:poeStance];
//        NSLog(@">>>>>>>>>>>>>>>>>> poe %i", pp);
//        
//        int rp = [self matchYourStance:globalVoterStance ToCandidateStance:roxasStance];
//        NSLog(@">>>>>>>>>>>>>>>>>> roxas %i", rp);
        
        
        
    }
    
}

- (NSArray *)getStanceArrayForPath:(NSString *)path {
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:path ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSArray *stance = [[[Stance alloc] init] getAllFromData:data];
    return stance;
}

- (int)matchYourStance:(NSArray *) voterStance ToCandidateStance: (NSArray *) candidateStance {
    int totalPoints = 0;
    
    for (int i = 0; i < issues.count; i++) {
        SummaryType candidateAnswer = (SummaryType)[[candidateStance objectAtIndex:i] summary];
        SummaryType voterAnswer = [[voterStance objectAtIndex:i] integerValue];
        
        if (voterAnswer != SummaryNoStance) {
            if (candidateAnswer == voterAnswer) {
                totalPoints++;
            }
        }
    }
    return totalPoints;
}

@end
