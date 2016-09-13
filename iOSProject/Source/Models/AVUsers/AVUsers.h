//
//  AVUsers.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

@interface AVUsers : AVArrayModel

+ (instancetype)usersWithCount:(NSUInteger)count;

- (instancetype)initWithCount:(NSUInteger)count;
- (void)addUsersWithCount:(NSUInteger)count;

@end
