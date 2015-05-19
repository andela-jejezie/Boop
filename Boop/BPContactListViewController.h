//
//  BPContactListViewController.h
//  Boop
//
//  Created by Johnson Ejezie on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPContactListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
