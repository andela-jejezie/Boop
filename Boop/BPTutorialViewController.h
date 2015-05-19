//
//  BPTutorialViewController.h
//  Boop
//
//  Created by Kehinde Shittu on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BPTutorialViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *actionBtn;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UIView *container;
@property (strong, nonatomic) IBOutlet UIPageControl *pageIndicator;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *btnText;


- (IBAction)actionBtn:(id)sender;
@end
