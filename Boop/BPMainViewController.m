//
//  BPMainViewController.m
//  Boop
//
//  Created by Johnson Ejezie on 5/18/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPMainViewController.h"

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
    [self topViewBorder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)topViewBorder {
    
    UIView* middleBar = [[UIView alloc]init];
    CGSize size = CGSizeMake(2, self.topView.frame.size.height - 2);
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
    
    self.bottomRightBorder = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x, self.topView.frame.origin.y + self.topView.frame.size.height - 2, self.view.frame.size.width/2, 2)];
    
    self.bottomRightBorder.backgroundColor = [UIColor blackColor];
    
    self.bottomLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, self.topView.frame.origin.y + self.topView.frame.size.height - 2, self.view.frame.size.width/2, 2)];
    self.bottomLeftBorder.backgroundColor = [UIColor blackColor];
    
//    [self.view addSubview:bottomLeftBorderView];
    [self.view addSubview:self.bottomRightBorder];
//    [self.view addSubview:topRightBorderView];
    [self.view addSubview:self.leftTopBorder];
    
    
    [self.view addSubview:middleBar];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = @"cells for table";
    
    return cell;
    
    
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)giveButtonAction:(id)sender {
    
    [self.leftTopBorder removeFromSuperview];
    [self.bottomRightBorder removeFromSuperview];
    [self.view addSubview:self.bottomLeftBorder];
    [self.view addSubview:self.topRightBorder];
}

- (IBAction)receiveButtonAction:(id)sender {
    
    [self.bottomLeftBorder removeFromSuperview];
    [self.topRightBorder removeFromSuperview];
    [self.view addSubview:self.leftTopBorder];
    [self.view addSubview:self.bottomRightBorder];
}
@end
