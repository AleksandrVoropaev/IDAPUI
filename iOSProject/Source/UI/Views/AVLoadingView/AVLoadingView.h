//
//  AVLoadingView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/13/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVLoadingView : UIView
@property (nonatomic, strong)   IBOutlet UIActivityIndicatorView    *activityIndicator;
@property (nonatomic, assign)   BOOL                                visible;

+ (instancetype)loadingViewForView:(UIView *)view;

- (void)setVisible:(BOOL)visible animated:(BOOL)animated;
- (void)setVisible:(BOOL)visible animated:(BOOL)animated completionHandler:(void (^)(void))completion;

@end
