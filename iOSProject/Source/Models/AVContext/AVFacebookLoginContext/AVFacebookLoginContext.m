//
//  AVFacebookLoginContext.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/31/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVFacebookLoginContext.h"

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AVImageModelsCache.h"

@implementation AVFacebookLoginContext

- (void)execute {
    FBSDKLoginManager *loginManager = [FBSDKLoginManager new];
    [loginManager logInWithReadPermissions:@[@"public_profile", @"email", @"user_friends"]
                        fromViewController:self.viewController
                                   handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                       AVUser *user = [AVUser new];
                                       if (error) {
                                           NSLog(@"%@", error.description);
                                           user.state = AVModelStateDidFailLoading;
                                       } else if (result.isCancelled) {
                                           NSLog(@"Result is cancelled");
                                           user.state = AVModelStateDidFailLoading;
                                       } else {
                                           [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
                                       parameters:nil] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                               if (error) {
                                                   NSLog(@"%@", error.description);
                                               } else {
                                                   user.userID = [[FBSDKAccessToken currentAccessToken] userID];
                                                   user.name = [result valueForKey:@"name"];
                                                   user.surname = [result valueForKey:@""];
                                                   user.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", [[FBSDKAccessToken currentAccessToken] userID]]];
                                                   //user.imageModel = [[AVImageModelsCache cache] imageModelWithURL:user.imageURL];
                                                   user.email =  [result valueForKey:@"email"];
                                                   user.friends =  [result valueForKey:@"friends"];
                                                   
                                                   user.state = AVModelStateDidLoad;
                                               }
                                           }];
                                       }
                                       
                                       self.user = user;
                                   }];
}

@end
