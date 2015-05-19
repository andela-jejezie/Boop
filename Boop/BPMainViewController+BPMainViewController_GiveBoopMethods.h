//
//  BPMainViewController+BPMainViewController_GiveBoopMethods.h
//  Boop
//
//  Created by Johnson Ejezie on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPMainViewController.h"
#import "BPUserData.h"


@interface BPMainViewController (BPMainViewController_GiveBoopMethods)
@property(nonatomic, strong)CKRecord* randomlySelectedFriend;
-(CKRecord*)getRandomFriend:(NSArray*)friends;
-(void)displayRandomlySelectedFriend:(CKRecord*)randomFriend;
-(void)subViewsDisplayDesign;
@end
