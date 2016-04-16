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

@end
