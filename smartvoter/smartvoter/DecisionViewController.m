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

int binay;
int duterte;
int defensorSantiago;
int poe;
int roxas;

@implementation DecisionViewController

//TODO: enum of answer
//TODO: 0 = No Stance, 1 = NO, 2 = YES

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //TODO: alisin
    [self evaluate:0 :0];
    
    
    
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
    [self nextQuestion];
}

- (void)btnNoStance:(id)obj {
    [self nextQuestion];
}

- (void)btnDisagree:(id)obj {
    [self nextQuestion];
}

- (void)nextQuestion {
    issueCounter++;
    if (issueCounter < issues.count) {
        [lblIssue setText:[[issues objectAtIndex:issueCounter] issue]];
    } else {
        NSLog(@">>>>>>>>>> EVALUATE");
    }
    
}

- (void)evaluate:(int)indexOfIssue :(int)answer {
    Issue *issue = [issues objectAtIndex:indexOfIssue];
    
    if (answer == 1) { //NO
        
    } else if (answer == 2) { //YES
    
    } else if (answer == 3) { //NO STANCE
        
    }
 
 
    NSArray *binayStance =   @[@1, @0, @1, @0, @1, @1, @1, @1];
    NSArray *duterteStance = @[@1, @1, @1, @0, @1, @1, @1, @0];
    NSArray *eliStance =     @[@0, @0, @0, @0, @0, @0, @0, @0];
    NSArray *eliStance1 =    @[@1, @1, @1, @1, @1, @1, @1, @1];

    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>> points ni binay vs sayo %i", [self matchYourStance:eliStance1 ToCandidateStance:binayStance]);
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>>> points ni duterte vs sayo %i", [self matchYourStance:eliStance1 ToCandidateStance:duterteStance]);
}

- (int)matchYourStance:(NSArray *) yourStance ToCandidateStance: (NSArray *) candidateStance {
    int issueCount = 8;
    int totalPointsNgKandidato = 0;
    for (int i = 0; i < issueCount; i++) {
        int candidateSagotSaIssue = (int)[candidateStance objectAtIndex:i];
        int yourSagotSaIssue = (int)[yourStance objectAtIndex:i];
        
        //TODO: lagyan ng if kapag no stance
        
        if (yourSagotSaIssue != 0) { //TODO ENUM DAPAT NOSTANCE
            if (candidateSagotSaIssue == yourSagotSaIssue) {
                NSLog(@"binay 1 point gryffindor");
                totalPointsNgKandidato++;
            }
        }
    }
    return totalPointsNgKandidato;
}

- (void)vote: (BOOL)b :(BOOL)s :(BOOL)d :(BOOL)p :(BOOL)m {
        NSLog(@">>>>>>>>>> %@",lblIssue.text);
}

@end
