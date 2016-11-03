//
//  AVFacebookLoginContext.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/31/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVContext.h"

#import "AVUser.h"

@interface AVFacebookLoginContext : AVContext
@property (nonatomic, strong)   UIViewController    *viewController;
@property (nonatomic, strong)   AVUser              *user;

@end
