//
//  BPMainViewController.h
//  Boop
//
//  Created by Johnson Ejezie on 5/18/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CloudKit/CloudKit.h>
@interface BPMainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic)CKRecord *randomFriend;

@property (weak, nonatomic) IBOutlet UIButton *receiveButton;
@property (weak, nonatomic) IBOutlet UIButton *giveButton;
- (IBAction)giveButtonAction:(id)sender;
- (IBAction)receiveButtonAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *giveBoopView;
@property (weak, nonatomic) IBOutlet UIImageView *friendImageView;
@property (weak, nonatomic) IBOutlet UILabel *friendNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *messageTextView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
- (IBAction)cancelButton:(id)sender;

- (IBAction)refreshFriendButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
- (IBAction)sendButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *chooseFriendButton;
- (IBAction)chooseFriendButton:(id)sender;

@end
