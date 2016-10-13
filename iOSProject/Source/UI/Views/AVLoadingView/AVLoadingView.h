//
//  AVLoadingView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/13/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVLoadingView : UIView

+ (instancetype)loadingViewForView:(UIView *)view;

- (void)becomeVisible;
- (void)becomeInvisible;

@end
