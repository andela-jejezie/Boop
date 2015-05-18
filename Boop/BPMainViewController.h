//
//  BPMainViewController.h
//  Boop
//
//  Created by Johnson Ejezie on 5/18/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPMainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIView *topView;

@property (weak, nonatomic) IBOutlet UIButton *receiveButton;
@property (weak, nonatomic) IBOutlet UIButton *giveButton;
- (IBAction)giveButtonAction:(id)sender;
- (IBAction)receiveButtonAction:(id)sender;

@end
