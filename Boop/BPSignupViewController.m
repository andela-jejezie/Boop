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
    if(![BPUserData sharedInstance].closeTutorialPage){
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changeTutorialPage)
                                                 name:@"Switch"
                                               object:nil];
    _titleTexts = @[@"Boop a friend and tell them what makes them great", @"Get booped back and see all the nice things your friends has to say about you", @"Can I get a boop Whoop!"];
    _btnTexts = @[@"Next", @"Next", @"Get Started"];
    
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    BPTutorialViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    }
    
    else{
   
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0 green:0.65 blue:0.49 alpha:1];
    self.navigationItem.hidesBackButton = YES;
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    loginButton.delegate = self;
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
//    BPUserData* bpUserData = [[BPUserData alloc]init];
    [self.view addSubview:loginButton];
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


-(void)getUser {
    if ([FBSDKAccessToken currentAccessToken]) {
        
        [[[FBSDKGraphRequest alloc]initWithGraphPath:@"me" parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            NSLog(@"id, %@", result);
            if (!error) {
                [BPUserData sharedInstance].currentUserFBResponse = result;
                [self fetchUserContact];
            }
        }];
    }
    
}



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

-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error {
    if (!error) {
        
        [self getUser];
        
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
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((BPTutorialViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((BPTutorialViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.titleTexts count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}


- (BPTutorialViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.titleTexts count] == 0) || (index >= [self.titleTexts count])) {
        NSLog(@"nill for %lu",(unsigned long)index);
        return nil;
    }
    // Create a new view controller and pass suitable data.
    BPTutorialViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.btnText = self.btnTexts[index];
    pageContentViewController.titleText = self.titleTexts[index];
    pageContentViewController.pageIndex = index;
    self.pageIndex = index;
    return pageContentViewController;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.self.titleTexts count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    NSUInteger pageIndex = ((BPTutorialViewController *) [_pageViewController.viewControllers objectAtIndex:0]).pageIndex;
    return pageIndex;
}

-(void)changeTutorialPage{
    NSArray* viewControllers = @[[self viewControllerAtIndex:self.pageIndex+1]];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}
@end
