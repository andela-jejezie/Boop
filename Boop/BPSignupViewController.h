//
//  BPSignupViewController.h
//  Boop
//
//  Created by Johnson Ejezie on 5/16/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "BPUserData.h"
#import "BPTutorialViewController.h"
@interface BPSignupViewController : UIViewController <UIPageViewControllerDataSource,FBSDKLoginButtonDelegate>
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (strong, nonatomic) NSArray *titleTexts;
@property (strong, nonatomic) NSArray *btnTexts;
@property NSUInteger pageIndex;

@end
