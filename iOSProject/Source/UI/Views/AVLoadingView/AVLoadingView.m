//
//  AVLoadingView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/13/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVLoadingView.h"
#import "NSBundle+AVExtensions.h"

const NSTimeInterval kAVLoadingViewDurationWithAnimation = 1;
const NSTimeInterval kAVLoadingViewDurationWithoutAnimation = 0;
const NSTimeInterval kAVLoadingViewDelay = 0;
const NSUInteger kAlphaVisible = 1.0;
const NSUInteger kAlphaInvisible = 0.0;

@implementation AVLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingViewForView:(UIView *)view {
    return [[self alloc] initWithView:view];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)initWithView:(UIView *)superview {
    self = [NSBundle objectFromNibWithClass:self.class];
    self.frame = superview.bounds;
//    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
//                            | UIViewAutoresizingFlexibleWidth
//                            | UIViewAutoresizingFlexibleRightMargin
//                            | UIViewAutoresizingFlexibleTopMargin
//                            | UIViewAutoresizingFlexibleHeight
//                            | UIViewAutoresizingFlexibleBottomMargin;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth
                            | UIViewAutoresizingFlexibleHeight;
    self.alpha = kAlphaInvisible;

    [superview addSubview:self];

    return self;
}

#pragma mark -
#pragma mark Public

- (void)setVisible:(BOOL)visible {
    [self setVisible:visible animated:YES];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated {
    [self setVisible:visible animated:animated completionHandler:nil];
}

- (void)setVisible:(BOOL)visible animated:(BOOL)animated completionHandler:(void (^)(void))completion {
    if (_visible != visible) {
        _visible = visible;
        
        if (visible) {
            [self.superview bringSubviewToFront:self];
        }
        
        [UIView animateWithDuration:animated ? kAVLoadingViewDurationWithAnimation : kAVLoadingViewDurationWithoutAnimation
                              delay:kAVLoadingViewDelay
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.alpha = visible ? kAlphaVisible : kAlphaInvisible;
                         }
                         completion:^(BOOL finished) {
                             if (!visible) {
                                 [self.superview sendSubviewToBack:self];
                             }
                             
                             if (completion) {
                                 completion();
                             }
                         }];
    }
}

@end
