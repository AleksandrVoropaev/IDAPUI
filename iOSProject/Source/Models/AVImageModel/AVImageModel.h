//
//  AVImageModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVImageModel : NSObject
@property (nonatomic, readonly)                     UIImage *image;
@property (nonatomic, readonly)                     NSURL   *url;
@property (nonatomic, readonly, getter=isLoaded)    BOOL    loaded;

@end
