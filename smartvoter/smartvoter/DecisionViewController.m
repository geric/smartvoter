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
#import "Candidate.h"
#import "RankingViewController.h"

int issueCounter;
NSArray *issues;
UILabel *lblIssue;

NSMutableArray *globalVoterStance;
NSArray *candidatesRanking;
int yourBaseAnswer = 21; //TODO must get from number of stances ; cant quantify percentage

NSMutableArray *allP;
NSMutableArray *allVP;

UIView *progressBar;
UILabel *qcounter;
int questionCounterStart = 1;

@implementation DecisionViewController

//TODO: enum of answer
//TODO: 0 = No Stance, 1 = NO, 2 = YES
//    globalVoterStance = @[
//                    @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree),
//                    @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree),
//                    @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree), @(SummaryAgree)
//                ];

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.callPresident) {
        [self setTitle:@"President"];
    } else {
        [self setTitle:@"Vice President"];
    }

    globalVoterStance = [[NSMutableArray alloc] init];
    [self populateCandidates];
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
    [lblIssue.layer setCornerRadius:15.0f];
    [lblIssue.layer setMasksToBounds:YES];
    
    
    progressBar = [self.view viewWithTag:9999];
    CGRect startFrame = CGRectMake(progressBar.frame.origin.x, progressBar.frame.origin.y, progressBar.frame.size.width, progressBar.frame.size.height);
    
    [progressBar setFrame:startFrame];
    
    qcounter = [self.view viewWithTag:123987];
    
    qcounter.text = @"1 / 21";
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void) setupProgressBar {


//    int increment = progressBar.frame.size.width / issues.count;
//    
//    NSLog(@"[[][][][][][] %i %f %i",increment, progressBar.frame.size.width, globalVoterStance.count);
//    
//    CGRect startFrame = CGRectMake(progressBar.frame.origin.x, progressBar.frame.origin.y, progressBar.frame.size.width+increment, progressBar.frame.size.height);
//
//    [UIView animateWithDuration:0.5 animations:^{
//        [progressBar setFrame:startFrame];
//    }];
//    [self.view setNeedsDisplay];
    
    
    NSString *text = [NSString stringWithFormat:@"%i / 21", questionCounterStart += 1];
    qcounter.text = text;
    
}

- (void) populateCandidates {
    allP = [[NSMutableArray alloc] init];
    allVP = [[NSMutableArray alloc] init];
    
    Candidate *binay = [[Candidate alloc] init];
    [binay setCan_id:@"1"];
    [binay setCan_name:@"Jejomar Binay"];
    [allP addObject:binay];
    
    Candidate *santiago = [[Candidate alloc] init];
    [santiago setCan_id:@"2"];
    [santiago setCan_name:@"Miriam Defensor Santiago"];
    [allP addObject:santiago];
    
    Candidate *duterte = [[Candidate alloc] init];
    [duterte setCan_id:@"3"];
    [duterte setCan_name:@"Rodrigo Duterte"];
    [allP addObject:duterte];
    
    Candidate *poe = [[Candidate alloc] init];
    [poe setCan_id:@"4"];
    [poe setCan_name:@"Grace Poe"];
    [allP addObject:poe];
    
    Candidate *roxas = [[Candidate alloc] init];
    [roxas setCan_id:@"5"];
    [roxas setCan_name:@"Mar Roxas"];
    [allP addObject:roxas];
    
    
    Candidate *cayetano = [[Candidate alloc] init];
    [cayetano setCan_id:@"7"];
    [cayetano setCan_name:@"Allan Peter Cayetano"];
    [allVP addObject:cayetano];
    
    Candidate *chiz = [[Candidate alloc] init];
    [chiz setCan_id:@"8"];
    [chiz setCan_name:@"Chiz Escudero"];
    [allVP addObject:chiz];
    
    Candidate *honasan = [[Candidate alloc] init];
    [honasan setCan_id:@"9"];
    [honasan setCan_name:@"Gringo Honasan"];
    [allVP addObject:honasan];
    
    Candidate *marcos = [[Candidate alloc] init];
    [marcos setCan_id:@"10"];
    [marcos setCan_name:@"Bongbong Marcos"];
    [allVP addObject:marcos];
    
    Candidate *robredo = [[Candidate alloc] init];
    [robredo setCan_id:@"11"];
    [robredo setCan_name:@"Leni Robredo"];
    [allVP addObject:robredo];
    
    Candidate *trillanes = [[Candidate alloc] init];
    [trillanes setCan_id:@"12"];
    [trillanes setCan_name:@"Antonio Trillanes"];
    [allVP addObject:trillanes];
}

- (void)btnAgree:(id)obj {
    [self setupProgressBar];
    [globalVoterStance addObject:@(SummaryAgree)];
    [self nextQuestion];
}

- (void)btnNoStance:(id)obj {
    [self setupProgressBar];
    [globalVoterStance addObject:@(SummaryNoStance)];
    [self nextQuestion];
}

- (void)btnDisagree:(id)obj {
    [self setupProgressBar];
    [globalVoterStance addObject:@(SummaryDisagree)];
    [self nextQuestion];
}

- (void)nextQuestion {
    issueCounter++;
    if (issueCounter < issues.count) {
        [lblIssue setText:[[issues objectAtIndex:issueCounter] issue]];
    } else {

        NSArray *candidates = self.callPresident ? allP : allVP;
        for (int i = 0; i < candidates.count; i++) {
            Candidate *candidate = [candidates objectAtIndex:i];
            NSArray *stanceArray = [self getStanceArrayForCandidate:candidate];
            int points = [self matchVoterStance:[globalVoterStance copy] ToCandidateStance:stanceArray];
            [candidate setPointsFromVoter:points];
        }
        
        // sort
        NSArray *sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"pointsFromVoter" ascending:NO]];
        candidatesRanking = [candidates sortedArrayUsingDescriptors:sortDescriptors];
     
        [self performSegueWithIdentifier:@"rankingSegue" sender:self];
    }
    
}

- (NSArray *)getStanceArrayForCandidate:(Candidate *)candidate {
    NSString *lastName = [[candidate.can_name.lowercaseString componentsSeparatedByString:@" "] lastObject];
    NSString *position = self.callPresident ? @"president": @"vicepresident";
    NSString *path = [NSString stringWithFormat:@"%@/%@%@Stance", position, candidate.can_id, lastName];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:path ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:jsonPath];
    NSArray *stance = [[[Stance alloc] init] getAllFromData:data];
    return stance;
}

- (int)matchVoterStance:(NSArray *) voterStance ToCandidateStance: (NSArray *) candidateStance {
    int totalPoints = 0;
    
    for (int i = 0; i < issues.count; i++) {
        SummaryType candidateAnswer = (SummaryType)[[candidateStance objectAtIndex:i] summary];
        SummaryType voterAnswer = [[voterStance objectAtIndex:i] integerValue];
        
        if (voterAnswer != SummaryNoStance) {
            if (candidateAnswer == voterAnswer) {
                totalPoints++;
            }
        } else {
            yourBaseAnswer -= 1; //for computation data
        }
    }
    return totalPoints;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    questionCounterStart = 1;
    if ([segue.identifier isEqual: @"rankingSegue"]) {
        RankingViewController *rvc = (RankingViewController *)[segue destinationViewController];
        [rvc setCandidatesRanking:candidatesRanking];
    }
}


@end
