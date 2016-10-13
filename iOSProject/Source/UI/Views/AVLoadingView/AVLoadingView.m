//
//  AVLoadingView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/13/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVLoadingView.h"

const NSTimeInterval kAVLoadingViewDuration = 3;
const NSTimeInterval kAVLoadingViewDelay = 0;
const NSUInteger kAlphaVisible = .7;
const NSUInteger kAlphaInvisible = 0;

@implementation AVLoadingView

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loadingViewForView:(UIView *)view {
    return [[self alloc] initWithView:view];
}

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    self.frame = self.superview.bounds;
    self.backgroundColor = [UIColor blackColor];
    self.alpha = kAlphaInvisible;
    [view addSubview:self];
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)becomeVisible {
//    NSLog(@"%@", self.superview);
    [self.superview bringSubviewToFront:self];
    [UIView animateWithDuration:kAVLoadingViewDuration
                          delay:kAVLoadingViewDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.alpha = kAlphaVisible;
                     }
                     completion:^(BOOL finished) {
                         [self becomeInvisible];
                     }];
}

- (void)becomeInvisible {
    [UIView animateWithDuration:kAVLoadingViewDuration
                          delay:kAVLoadingViewDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.alpha = kAlphaInvisible;
                     }
                     completion:^(BOOL finished) {
                         [self.superview sendSubviewToBack:self];
                     }];
}

@end
