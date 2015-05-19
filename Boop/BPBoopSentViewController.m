//
//  BPBoopSentViewController.m
//  Boop
//
//  Created by Johnson Ejezie on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPBoopSentViewController.h"

@interface BPBoopSentViewController ()

@end

@implementation BPBoopSentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    self.boopAnotherFriendButton.layer.borderWidth = 2.0f;
    self.boopAnotherFriendButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.boopAnotherFriendButton.layer.cornerRadius = 15.0f;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)boopAnotherFriendButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES ];
}
@end
