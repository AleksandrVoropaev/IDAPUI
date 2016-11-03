//
//  AVFacebookFriendsLoadContext.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 11/3/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVContext.h"

@interface AVFacebookFriendsLoadContext : AVContext
@property (nonatomic, strong)   NSString        *userID;
@property (nonatomic, readonly) NSMutableArray  *friendsModels;

@end
