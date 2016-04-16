//
//  DecisionViewController.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "DecisionViewController.h"
#import "Issue.h"

int issueCounter;
NSArray *issues;
UILabel *lblIssue;

@implementation DecisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    issueCounter = 0;
    
    lblIssue = [self.view viewWithTag:111];
    UIButton *btnAgree = [self.view viewWithTag:1111];
    UIButton *btnNoStance = [self.view viewWithTag:2222];
    UIButton *btnDisagree = [self.view viewWithTag:3333];
    
    [btnAgree addTarget:self action:@selector(nextQuestion:) forControlEvents:UIControlEventTouchUpInside];
    
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"allIssues" ofType:@"json"];
    NSData *issueData = [[NSData alloc] initWithContentsOfFile:jsonPath];
    issues = [[[Issue alloc] init] getAllFromData:issueData];
    
    Issue *is = [issues objectAtIndex:0];
    [lblIssue setText:is.issue];
}

- (void)nextQuestion:(id)obj {
    issueCounter++;
    [lblIssue setText:[[issues objectAtIndex:issueCounter] issue]];
    NSLog(@">>>>>>>>>> %@",lblIssue);
}

@end
