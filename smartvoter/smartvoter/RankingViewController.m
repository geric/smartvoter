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
        NSLog(@"+++++++++++++++++++ %i %@", c.pointsFromVoter, c.can_name);
    }
    
}

- (int)rowCount {
    NSMutableArray *uniqueIndexes = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.candidatesRanking.count; i++) {
        Candidate *candidate = (Candidate *)[self.candidatesRanking objectAtIndex:i];
        [uniqueIndexes addObject:[NSNumber numberWithInt:candidate.pointsFromVoter]];
    }
    set = [NSOrderedSet orderedSetWithArray:uniqueIndexes];
    NSLog(@"aaaaa %i %@", [[set array] count], set);
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
    
    /** safe does not print same values **/
//    Candidate *candidate = [self.candidatesRanking objectAtIndex:indexPath.row];
//    NSString *names = [NSString stringWithFormat:@"%@ %d", candidate.can_name, candidate.pointsFromVoter];
//    cell.textLabel.text = names;
//    return cell;
    

    
    
    /** print same values on same cell **/
    
    NSMutableArray* test1 = [[NSMutableArray alloc] init];
//    CGSize cellSize = cell.frame.size;
//    CGPoint cellPoint = cell.frame.size
//    
//    
//    CGSizeMake(cell.frame.  self.candidatesRanking.count, 60.0f);
    
    NSArray *cgFloats = @[@0.0f, @1.0f, @2.0f, @3.0f, @4.0f, @5.0f];

    
    for (int i=0; i < self.candidatesRanking.count; i++) {
        Candidate *candidate = [self.candidatesRanking objectAtIndex:i];
            NSLog(@"PUGS candidate: %@ %i VS %@ ", candidate.can_name,candidate.pointsFromVoter,  [set objectAtIndex:indexPath.row]);
            if ([[NSNumber numberWithInt:candidate.pointsFromVoter] integerValue] == [[set objectAtIndex:indexPath.row] integerValue]) {
                //[test1 addObject:[NSString stringWithFormat:@"%@", candidate.can_name]];
                NSLog(@"pugs %@ may nagtugma! s points", candidate.can_name);
                
//                UIImageView *canImgView = [[UIImageView alloc] initWithFrame:CGRectMake((float) indexPath.row*20.0, 8.0, 60.0, 60.0)];

               UIImageView *canImgView = [[UIImageView alloc] initWithFrame:CGRectMake([[cgFloats objectAtIndex:i] floatValue]*50.0, 8.0, 60.0, 60.0)];
                NSString *name = [NSString stringWithFormat:@"%@-p.jpg", candidate.can_id];
                [canImgView setImage:[UIImage imageNamed:name]];
//                [test1 addObject:canImgView];
                [cell addSubview:canImgView];
                
                NSLog(@"indexpath r0w :%@", cgFloats[i]);
            }
    }
    
//    NSString *combined = [test1 componentsJoinedByString:@","];
//    cell.textLabel.text = combined;
    return cell;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSString *identifier = @"cellIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    
//    NSLog(@"pugs %i count ", self.candidatesRanking.count);
//    
//    for (int i=0; i < self.candidatesRanking.count; i++) {
//        Candidate *candidate = [self.candidatesRanking objectAtIndex:i];
//        
//        //NSLog(@"bbbb %@ count hodor", [set objectAtIndex:indexPath.row]);
//        
//        //NSLog(@"bbbb %i count hodor %@", candidate.pointsFromVoter, [set objectAtIndex:indexPath.row]);
//        
//        if ([NSNumber numberWithInt:candidate.pointsFromVoter] == [set objectAtIndex:indexPath.row]) {
//            NSString *names = [NSString stringWithFormat:@"%@ %@", cell.textLabel.text, candidate.can_name];
//            cell.textLabel.text = names;
//            NSLog(@"bbbb %i count hodor %@", candidate.pointsFromVoter, [set objectAtIndex:indexPath.row]);
//        }
//        
//    }
//    return cell;
//}

/** backup **/

/*
- (int)rowCount {
    return self.candidatesRanking.count;
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
    
    Candidate *candidate = [self.candidatesRanking objectAtIndex:indexPath.row];
    
    NSString *names = [NSString stringWithFormat:@"%@ %d", candidate.can_name, candidate.pointsFromVoter];
    cell.textLabel.text = names;
    return cell;
}
*/



@end
