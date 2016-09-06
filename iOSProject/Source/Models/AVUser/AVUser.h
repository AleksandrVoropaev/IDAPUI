//
//  AVUser.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AVUser : NSObject
@property (nonatomic, copy)     NSString    *name;
@property (nonatomic, copy)     NSString    *surname;
@property (nonatomic, readonly) NSString    *fullname;
@property (nonatomic, readonly) UIImage     *image;

@end
