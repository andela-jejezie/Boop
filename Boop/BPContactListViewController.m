//
//  BPContactListViewController.m
//  Boop
//
//  Created by Johnson Ejezie on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPContactListViewController.h"
#import <CloudKit/CloudKit.h>
#import "BPUserData.h"
@implementation BPContactListViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [BPUserData sharedInstance].currentUserContacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ContactListCell"];
    
    CKRecord* list = [BPUserData sharedInstance].currentUserContacts[indexPath.row];
    
    cell.textLabel.text = list[@"name"];
    
    return cell;
    
}

@end
