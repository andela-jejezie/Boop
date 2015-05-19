//
//  BPMainViewController+BPMainViewController_GiveBoopMethods.m
//  Boop
//
//  Created by Johnson Ejezie on 5/19/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPMainViewController+BPMainViewController_GiveBoopMethods.h"

@implementation BPMainViewController (BPMainViewController_GiveBoopMethods)

-(CKRecord*)getRandomFriend:(NSArray*)friends {
   return [BPUserData sharedInstance].currentUserContacts[[BPUserData sharedInstance].currentUserContacts.count - 1];
}
-(void)displayRandomlySelectedFriend:(CKRecord*)randomFriend {
    
    self.friendNameLabel.text = randomFriend[@"name"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSData* friendImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[randomFriend valueForKey:@"picture"]]];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (!friendImageData) {
                self.friendImageView.image = [UIImage imageNamed:@"reload_refresh_alt"];
            }else {
                self.friendImageView.image = [UIImage imageWithData:friendImageData];

            }
        });
    });
}
-(void)subViewsDisplayDesign {
    self.cancelButton.layer.borderWidth = 2.0f;
    self.cancelButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.cancelButton.layer.cornerRadius = 10.0f;
    
    self.messageTextView.layer.borderWidth = 2.0f;
    self.messageTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.messageTextView.layer.cornerRadius = 15.0f;
    
    self.sendButton.layer.borderWidth = 2.0f;
    self.sendButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.sendButton.layer.cornerRadius = 10.0f;
    
    self.receiveButton.layer.borderWidth = 1.0f;
    self.receiveButton.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6].CGColor;
    
    self.giveButton.layer.borderWidth = 1.0f;
    self.giveButton.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6].CGColor;
    
    self.chooseFriendButton.layer.borderWidth = 2.0f;
    self.chooseFriendButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.chooseFriendButton.layer.cornerRadius = 15.0f;
    
}

@end
