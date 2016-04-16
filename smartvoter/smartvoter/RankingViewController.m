//
//  RankingViewController.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "RankingViewController.h"
#import "Candidate.h"

NSOrderedSet *set;

@implementation RankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *lblRanking = [self.view viewWithTag:4444];
    [lblRanking setLineBreakMode:NSLineBreakByWordWrapping];
    [lblRanking setNumberOfLines:0];
    
    UITableView *tblRanking =[self.view viewWithTag:5555];
    [tblRanking setDelegate:self];
    [tblRanking setDataSource:self];

    for (Candidate *c in self.candidatesRanking) {
        NSLog(@"+++++++++++++++++++ %i", c.pointsFromVoter);
    }
    
}

- (int)rowCount {
    NSMutableArray *uniqueIndexes = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.candidatesRanking.count; i++) {
        Candidate *candidate = (Candidate *)[self.candidatesRanking objectAtIndex:i];
        [uniqueIndexes addObject:[NSNumber numberWithInt:candidate.pointsFromVoter]];
    }
    set = [NSOrderedSet orderedSetWithArray:uniqueIndexes];
    return [[set array] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self rowCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    for (int i=0; i < self.candidatesRanking.count; i++) {
        Candidate *candidate = [self.candidatesRanking objectAtIndex:i];
        if ([NSNumber numberWithInt:candidate.pointsFromVoter] == [set objectAtIndex:indexPath.row]) {
            NSString *names = [NSString stringWithFormat:@"%@ %@", cell.textLabel.text, candidate.can_name];
            cell.textLabel.text = names;
        }
        
    }
    return cell;
}


@end
