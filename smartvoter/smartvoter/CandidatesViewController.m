//
//  CandidatesViewController.m
//  smartvoter
//
//  Created by geric encarnacion on 16/4/16.
//  Copyright © 2016 geric encarnacion. All rights reserved.
//

#import "CandidatesViewController.h"
#import "Candidate.h"
#import "ProfileViewController.h"

NSMutableArray *allPres;
NSMutableArray *allVPres;
Candidate *selectedCandidate;

@implementation CandidatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionView *ucv = [self.view viewWithTag:7777];
    [ucv setDataSource:self];
    [ucv setDelegate:self];
    [self populateCandidates];
}


- (void) populateCandidates {
    allPres = [[NSMutableArray alloc] init];
    allVPres = [[NSMutableArray alloc] init];
    
    Candidate *binay = [[Candidate alloc] init];
    [binay setCan_id:@"1"];
    [binay setCan_name:@"Jejomar Binay"];
    [allPres addObject:binay];
    
    Candidate *santiago = [[Candidate alloc] init];
    [santiago setCan_id:@"2"];
    [santiago setCan_name:@"Miriam Defensor Santiago"];
    [allPres addObject:santiago];
    
    Candidate *duterte = [[Candidate alloc] init];
    [duterte setCan_id:@"3"];
    [duterte setCan_name:@"Rodrigo Duterte"];
    [allPres addObject:duterte];
    
    Candidate *poe = [[Candidate alloc] init];
    [poe setCan_id:@"4"];
    [poe setCan_name:@"Grace Poe"];
    [allPres addObject:poe];
    
    Candidate *roxas = [[Candidate alloc] init];
    [roxas setCan_id:@"5"];
    [roxas setCan_name:@"Mar Roxas"];
    [allPres addObject:roxas];
    
    
    Candidate *cayetano = [[Candidate alloc] init];
    [cayetano setCan_id:@"7"];
    [cayetano setCan_name:@"Allan Peter Cayetano"];
    [allVPres addObject:cayetano];
    
    Candidate *chiz = [[Candidate alloc] init];
    [chiz setCan_id:@"8"];
    [chiz setCan_name:@"Chiz Escudero"];
    [allVPres addObject:chiz];
    
    Candidate *honasan = [[Candidate alloc] init];
    [honasan setCan_id:@"9"];
    [honasan setCan_name:@"Gringo Honasan"];
    [allVPres addObject:honasan];
    
    Candidate *marcos = [[Candidate alloc] init];
    [marcos setCan_id:@"10"];
    [marcos setCan_name:@"Bongbong Marcos"];
    [allVPres addObject:marcos];
    
    Candidate *robredo = [[Candidate alloc] init];
    [robredo setCan_id:@"11"];
    [robredo setCan_name:@"Leni Robredo"];
    [allVPres addObject:robredo];
    
    Candidate *trillanes = [[Candidate alloc] init];
    [trillanes setCan_id:@"12"];
    [trillanes setCan_name:@"Antonio Trillanes"];
    [allVPres addObject:trillanes];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    int itemCount;
    if (section == 0) { //P
        itemCount = allPres.count;
    } else if(section == 1) { //VP
        itemCount = allVPres.count;
    }
    return itemCount;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cellView";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSArray *data;
    if (indexPath.section == 0) {
        data = [[NSArray alloc] initWithArray:allPres.copy];
    } else if(indexPath.section == 1) {
        data = [[NSArray alloc] initWithArray:allVPres.copy];
    }
    
    UIButton *button = [cell viewWithTag:121212];
    [button setTitle:[[data objectAtIndex:indexPath.row] can_name] forState:UIControlStateNormal];
    
    
    //UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    //recipeImageView.image = [UIImage imageNamed:[recipeImageView objectAtIndex:indexPath.row]];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *data;
    if (indexPath.section == 0) {
        data = [[NSArray alloc] initWithArray:allPres.copy];
    } else if(indexPath.section == 1) {
        data = [[NSArray alloc] initWithArray:allVPres.copy];
    }
    selectedCandidate = [data objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"profileViewSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual: @"profileViewSegue"]) {
        ProfileViewController *pvc = (ProfileViewController *)[segue destinationViewController];
        [pvc setSelectedCandidate:selectedCandidate];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}


@end
