//
//  AVImageView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVModel.h"
@class AVImageModel;

@interface AVImageView : UIView <AVModelObserver>
@property (nonatomic, strong)   IBOutlet UIImageView    *contentImageView;
@property (nonatomic, strong)   AVImageModel            *imageModel;

@end
