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
    loginButton.delegate = self;
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
//    BPUserData* bpUserData = [[BPUserData alloc]init];
    
    
    [self.view addSubview:loginButton];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            NSLog(@"id, %@", result);
            if (!error) {
                [BPUserData sharedInstance].currentUserFBResponse = result;
                [self fetchUserContact];
            }
        }];
      
    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

//-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
//    
//    BPUserData* bpUserData = [[BPUserData alloc]init];
//
//    if ([FBSDKAccessToken currentAccessToken]) {
//        [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
//            NSLog(@"id, %@", result);
//            if (!error) {
//                [bpUserData saveUser:result completion:^{
//                    NSLog(@"done");
//                    NSLog(@"current user %@", [BPUserData sharedInstance].currentUserData);
//                }];
//            }
//        }];
//        [self fetchUserContact];
//    }
//}



-(void)fetchUserContact {
    [
     [[FBSDKGraphRequest alloc] initWithGraphPath:@"me/taggable_friends" parameters:nil]
     
     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        if (!error) {
             [BPUserData sharedInstance].currentUserContactsFBResponse = result[@"data"];
//        BPUserData *userObject = [[BPUserData alloc] init];
        [[BPUserData sharedInstance] saveUser:[BPUserData sharedInstance].currentUserFBResponse completion:^{
            NSLog(@"completed user and user's connection registration");
        }];
            NSLog(@"contact %@", [BPUserData sharedInstance].currentUserContactsFBResponse[0]);
            NSLog(@"number of contacts %lu",  (unsigned long)[BPUserData sharedInstance].currentUserContactsFBResponse.count);
         }
         else{
             NSLog(@"facebook fetch contacts error %@, error code %ld", error,(long)error.code);
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
