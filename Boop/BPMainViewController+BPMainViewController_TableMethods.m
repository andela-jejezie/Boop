//
//  BPMainViewController+BPMainViewController_TableMethods.m
//  Boop
//
//  Created by Johnson Ejezie on 5/18/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPMainViewController+BPMainViewController_TableMethods.h"

@implementation BPMainViewController (BPMainViewController_TableMethods)

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = @"cells for table";
    
    return cell;
}

@end
