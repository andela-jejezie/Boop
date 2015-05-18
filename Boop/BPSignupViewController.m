//
//  BPSignupViewController.m
//  Boop
//
//  Created by Johnson Ejezie on 5/16/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPSignupViewController.h"

@interface BPSignupViewController ()

@end

@implementation BPSignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    BPUserData* bpUserData = [[BPUserData alloc]init];
    
    
    [self.view addSubview:loginButton];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            if (!error) {
               [bpUserData saveUser:result completion:^{
                   NSLog(@"done");
                   NSLog(@"current user %@", [BPUserData sharedInstance].currentUserData);
                   
               }];
                

            }
        }];
        [self fetchUserContact];
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)fetchUserContact {
    
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me/taggable_friends" parameters:nil]
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
         if (!error) {
             [BPUserData sharedInstance].currentUserContacts = result[@"data"];
                              NSLog(@"contact %@", [BPUserData sharedInstance].currentUserContacts[0]);
             //                 [bpUserData saveUserContact:[BPUserData sharedInstance].currentUserContacts completion:^{
             //                     NSLog(@"completed");
             //                 }];
         }
     }];
    
    
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

@end
