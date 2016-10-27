//
//  AVImageModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVModel.h"

@interface AVImageModel : AVModel
@property (nonatomic, readonly)     UIImage     *image;
@property (nonatomic, readonly)     NSURL       *url;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

@end
