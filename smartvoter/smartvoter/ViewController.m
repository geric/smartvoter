//
//  ViewController.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "ViewController.h"
#import "Issue.h"
#import "DecisionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *lblCountdown = [self.view viewWithTag:6666];
    [lblCountdown setText: [self computeRemainingDays]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DecisionViewController *rvc = (DecisionViewController *)[segue destinationViewController];
    if ([segue.identifier isEqual: @"pSegue"]) {
        [rvc setCallPresident:YES];
    } else  if ([segue.identifier isEqual: @"vpSegue"]) {
        [rvc setCallPresident:NO];
    }
}

- (NSString *) computeRemainingDays {
    NSDate *start = [NSDate date];
    
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd"];
    NSDate *end = [f dateFromString:@"2016-05-09"]; //Election 2016
    NSCalendar *gc = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comp = [gc components:NSCalendarUnitDay fromDate:start toDate:end options:NSCalendarWrapComponents];
    return [NSString stringWithFormat:@"%i", [comp day]];
    
}

@end
