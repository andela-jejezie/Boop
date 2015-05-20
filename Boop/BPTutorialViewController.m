//
//  BPTutorialViewController.m
//  Boop
//
//  Created by Kehinde Shittu on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPTutorialViewController.h"
#import "BPUserData.h"
@interface BPTutorialViewController ()

@end

@implementation BPTutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pageIndicator.currentPage = self.pageIndex;
    // Do any additional setup after loading the view.
//    self.title = @"Knotwork";
//    self.imageView.image = [UIImage imageNamed:self.imageFile];
    self.container.layer.borderWidth = 2.5;
    self.container.layer.borderColor = [UIColor blackColor].CGColor;
    self.container.layer.cornerRadius = 40.0;
    self.textLabel.text = self.titleText;
    [self.actionBtn setTitle:self.btnText forState:UIControlStateNormal];
//    [self.actionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.actionBtn.layer.borderColor = [UIColor blackColor].CGColor;
    self.actionBtn.layer.borderWidth = 2.0;
    self.actionBtn.layer.cornerRadius = 20;
//    self.actionBtn.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)actionBtn:(id)sender {
    if(self.pageIndex < 2){
        NSLog(@"Next");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Switch"
                                                            object:self
                                                          userInfo:nil];
    }else{
        NSLog(@"Get Started");
        [BPUserData sharedInstance].closeTutorialPage = YES;
        [self performSegueWithIdentifier:@"GetStarted" sender:nil];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"GetStarted"]) {
        
    }
}
@end
