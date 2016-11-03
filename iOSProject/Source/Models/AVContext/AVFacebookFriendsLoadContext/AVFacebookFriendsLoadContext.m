//
//  AVFacebookFriendsLoadContext.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 11/3/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVFacebookFriendsLoadContext.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AVUser.h"

@interface AVFacebookFriendsLoadContext ()
@property (nonatomic, strong)   NSSet   *friends;

@end

@implementation AVFacebookFriendsLoadContext

- (void)execute {
    NSDictionary *parameters = [NSDictionary dictionaryWithObject:@"email, first_name, last_name, picture"
                                                           forKey:@"fields"];
    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        NSString *currentUserID = [[FBSDKAccessToken currentAccessToken] userID];
        if (self.userID == currentUserID) {
            self.friends = [result valueForKey:@"friends"];
            for (id friend in self.friends) {
                [self loadFriendInformation:friend];
            }
        }
    }];
}

- (void)loadFriendInformation:(NSDictionary *)friend {
    AVUser *user = [AVUser new];
    user.userID = [friend valueForKey:@"userID"];
    user.name = [friend valueForKey:@"first_name"];
    user.surname = [friend valueForKey:@"last_name"];
    user.imageURL = [NSURL URLWithString:[friend valueForKey:@"picture{url}"]];
    //user.imageModel = ;
    user.email = [friend valueForKey:@"email"];
    
    user.state = AVModelStateDidLoad;
    [self.friendsModels addObject:user];
}

@end
