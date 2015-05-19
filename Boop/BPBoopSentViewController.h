//
//  BPBoopSentViewController.h
//  Boop
//
//  Created by Johnson Ejezie on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPMainViewController.h"

@interface BPBoopSentViewController : BPMainViewController
@property (weak, nonatomic) IBOutlet UILabel *successMessageLabel;
@property (weak, nonatomic) IBOutlet UIButton *boopAnotherFriendButton;
- (IBAction)boopAnotherFriendButton:(id)sender;

@end
