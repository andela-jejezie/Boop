//
//  BPUserData.h
//  Boop
//
//  Created by Johnson Ejezie on 5/16/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CloudKit/CloudKit.h>
#import <UIKit/UIKit.h>

@interface BPUserData : NSObject
@property(nonatomic, strong)CKRecord* currentUserData;
@property(nonatomic, strong)CKRecord* selectedForChat;
@property(nonatomic, strong)NSDictionary* currentUserFBResponse;
@property(nonatomic, strong)NSMutableArray* currentUserContactsFBResponse;
@property(nonatomic, strong)NSMutableArray* currentUserContacts;
@property(nonatomic, strong) CKContainer *bpContainer;
@property(nonatomic, strong) CKDatabase *bpPublicDatabase;
@property(nonatomic,strong) CKRecord* refRecord;
@property(nonatomic,strong) NSString* typeOfUser;



-(id)init:(CKRecord*)currentUserData currentUserContacts:(NSMutableArray *)currentUserContacts UserData:(CKRecord*)UserData;
+ (BPUserData*)sharedInstance;

- (void)saveUser:(NSDictionary *)userData completion:(void (^)(void))completionBlock;
- (void)saveUserContact:(NSMutableArray *)userContacts completion:(void (^)(void))completionBlock;
@end
