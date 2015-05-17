//
//  BPUserData.m
//  Boop
//
//  Created by Johnson Ejezie on 5/16/15.
//  Copyright (c) 2015 Johnson Ejezie. All rights reserved.
//

#import "BPUserData.h"


@implementation BPUserData

-(id)init:(CKRecord *)currentUserData currentUserContacts:(NSMutableArray *)currentUserContacts {
    self = [super init];
    if (self) {
        _currentUserData = currentUserData;
        _currentUserContacts = currentUserContacts;
    }
    return self;
}

+(BPUserData *)sharedInstance {
    
    static BPUserData *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[BPUserData alloc] init];
    });
    return _sharedInstance;
}

-(void)saveUser:(NSDictionary *)userData completion:(void (^)(void))completionBlock {
    
    
    self.bpContainer = [CKContainer defaultContainer];
    self.bpPublicDatabase = [self.bpContainer publicCloudDatabase];
    self.typeOfUser = @"BU";
    
    [self.bpContainer fetchUserRecordIDWithCompletionHandler:^(CKRecordID *recordID, NSError *error) {
        if (!error) {
            CKRecordID *userRecordIDString = [[CKRecordID alloc] initWithRecordName:[NSString stringWithFormat:@"%@%@",self.typeOfUser, recordID.recordName]];
            NSLog(@"the formated id %@",userRecordIDString);
            CKRecord *bpUserRecord = [[CKRecord alloc] initWithRecordType:@"boopUsers" recordID:userRecordIDString];
            bpUserRecord[@"firstName"] = [userData[@"first_name"] capitalizedString];
            bpUserRecord[@"lastName"] = [userData[@"last_name"] capitalizedString];
            bpUserRecord[@"link" ] = userData[@"link"];
            bpUserRecord[@"registeredBoopUser"] = @"YES";
            bpUserRecord[@"picture"] = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", userData[@"id"]];
            bpUserRecord[@"id"] = userData[@"id"];
            bpUserRecord[@"email"] = userData[@"email"];
            bpUserRecord[@"gender"] = userData[@"gender"];
            
            // set current user record for use when referencing ghost.
            self.refRecord = bpUserRecord;
            
            [self.bpPublicDatabase saveRecord:bpUserRecord completionHandler:^(CKRecord *record, NSError *error) {
                if (!error) {
                    NSLog(@"saved user %@", record);
                }else {
                   NSLog(@"error saving user %@", error);
                }
            }];
        }
    }];
}


@end
