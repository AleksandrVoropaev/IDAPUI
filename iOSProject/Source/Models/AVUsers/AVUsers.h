//
//  AVUsers.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

@interface AVUsers : AVArrayModel

+ (instancetype)usersWithUsers:(NSArray *)users;
+ (instancetype)usersWithCount:(NSUInteger)count;

- (NSArray *)users;
- (void)addRandomUsersWithCount:(NSUInteger)count;
- (void)addUsers:(NSArray *)users;

@end
