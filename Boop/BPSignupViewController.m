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
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [self getUserData];
        [self fetchUserContact];
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)getUserData {
//    BPUserData* bpUserData = [[BPUserData alloc]init];
    
    [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            [[BPUserData sharedInstance] saveUser:result completion:^{
                NSLog(@"done");
                
                
            }];
            
            
        }
    }];
    
    NSLog(@"current user %@", [BPUserData sharedInstance].UserData);
    
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

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (!error) {
        [self getUserData];
        [self fetchUserContact];
    }
    NSLog(@"login in");
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
    NSLog(@"log out");
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

- (IBAction)check:(id)sender {
    
    [self performSegueWithIdentifier:@"mainView" sender:nil];
}
@end
