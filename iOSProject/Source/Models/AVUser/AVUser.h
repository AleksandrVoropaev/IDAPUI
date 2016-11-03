//
//  AVUser.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "AVModel.h"

@class AVImageModel;

@interface AVUser : AVModel <NSCoding>
@property (nonatomic, copy)     NSString        *userID;
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, copy)     NSString        *surname;
@property (nonatomic, readonly) NSString        *fullname;
@property (nonatomic, copy)     NSURL           *imageURL;
@property (nonatomic, readonly) AVImageModel    *imageModel;
@property (nonatomic, copy)     NSString        *email;
@property (nonatomic, strong)   NSSet           *friends;

@end
