//
//  BPMainViewController.m
//  Boop
//
//  Created by Johnson Ejezie on 5/18/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPMainViewController.h"
#import "BPUserData.h"
#import "BPMainViewController+BPMainViewController_GiveBoopMethods.h"


@interface BPMainViewController ()
@property(nonatomic, strong)UIView* middleBar;
@property(nonatomic, strong)UIView* leftTopBorder;
@property(nonatomic, strong) UIView* topRightBorder;
@property(nonatomic, strong)UIView* bottomRightBorder;
@property(nonatomic, strong)UIView* bottomLeftBorder;

@end

@implementation BPMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0 green:0.65 blue:0.49 alpha:1];

}

-(void)viewWillAppear:(BOOL)animated {
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0 green:0.65 blue:0.49 alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor whiteColor],NSForegroundColorAttributeName,
                                    [UIColor whiteColor],NSBackgroundColorAttributeName,
                                    [UIFont fontWithName:@"OpenSans-Bold" size:22.0], NSFontAttributeName,
                                    nil];
    self.navigationController.navigationBar.titleTextAttributes = textAttributes;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [self topViewBorder];
    [self subViewsDisplayDesign];
    self.randomFriend = [self getRandomFriend:[BPUserData sharedInstance].currentUserContacts];
    [self displayRandomlySelectedFriend:self.randomFriend];
    
}

-(void)topViewBorder {
    
    UIView* middleBar = [[UIView alloc]init];
    CGSize size = CGSizeMake(2, self.topView.frame.size.height + 5);
    CGPoint originPoint = CGPointMake(middleBar.frame.origin.x, middleBar.frame.origin.y);
    originPoint.y = self.topView.frame.origin.y;
    CGRect frame = middleBar.frame;
    frame.size = size;
    frame.origin = originPoint;
    middleBar.frame = frame;
    CGPoint point = self.topView.center;
    point.x = self.view.center.x;
    middleBar.center = point;
    middleBar.backgroundColor = [UIColor blackColor];
    
   self.leftTopBorder = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x
                                                                    , self.topView.frame.origin.y, self.view.frame.size.width/2, 2)];
    self.leftTopBorder.backgroundColor = [UIColor blackColor];
    
    self.topRightBorder = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x, self.topView.frame.origin.y, self.view.frame.size.width/2, 2)];
    self.topRightBorder.backgroundColor = [UIColor blackColor];
    
    self.bottomRightBorder = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x, self.topView.frame.origin.y + self.topView.frame.size.height, self.view.frame.size.width/2, 2)];
    
    self.bottomRightBorder.backgroundColor = [UIColor blackColor];
    
    self.bottomLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, self.topView.frame.origin.y + self.topView.frame.size.height, self.view.frame.size.width/2, 2)];
    self.bottomLeftBorder.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.bottomRightBorder];
    [self.view addSubview:self.leftTopBorder];
    
    
    [self.view addSubview:middleBar];
    
}
- (IBAction)giveButtonAction:(id)sender {
    
    [self.leftTopBorder removeFromSuperview];
    [self.bottomRightBorder removeFromSuperview];
    [self.view addSubview:self.bottomLeftBorder];
    [self.view addSubview:self.topRightBorder];
    
    NSLog(@"result for contacts %@", [BPUserData sharedInstance].currentUserContacts);
}


- (IBAction)receiveButtonAction:(id)sender {
    
    [self.bottomLeftBorder removeFromSuperview];
    [self.topRightBorder removeFromSuperview];
    [self.view addSubview:self.leftTopBorder];
    [self.view addSubview:self.bottomRightBorder];
}
- (IBAction)cancelButton:(id)sender {
}

- (IBAction)refreshFriendButton:(id)sender {
}
- (IBAction)sendButton:(id)sender {
}
- (IBAction)chooseFriendButton:(id)sender {
    
    [self performSegueWithIdentifier:@"ContactListViewSegue" sender:nil];
}
@end
