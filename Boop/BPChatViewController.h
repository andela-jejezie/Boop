//
//  BPChatViewController.h
//  Boop
//
//  Created by Kehinde Shittu on 5/18/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Firebase/Firebase.h>

@interface BPChatViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) NSMutableArray* chat;
@property (nonatomic, strong) Firebase* firebase;

- (IBAction)sendButton:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *chatTable;
@property (strong, nonatomic) IBOutlet UITextField *chatText;


@end
