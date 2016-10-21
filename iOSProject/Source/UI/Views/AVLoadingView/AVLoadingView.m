//
//  AVLoadingView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/13/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVLoadingView.h"
#import "NSBundle+AVExtensions.h"

const NSTimeInterval kAVLoadingViewDuration = 1;
const NSTimeInterval kAVLoadingViewDelay = 0;
const NSUInteger kAlphaVisible = .8;
const NSUInteger kAlphaInvisible = .2;

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
    self.activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleWidth & UIViewAutoresizingFlexibleHeight;
    self.frame = superview.bounds;
    
    [superview addSubview:self];

    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    
    self.backgroundColor = [UIColor yellowColor];
    self.alpha = kAlphaInvisible;
}

#pragma mark -
#pragma mark Public

- (void)setVisible:(BOOL)visible {
    if (_visible != visible) {
        _visible = visible;
    }
    
    if (visible) {
        [self.superview bringSubviewToFront:self];
    }
    
    [UIView animateWithDuration:kAVLoadingViewDuration
                          delay:kAVLoadingViewDelay
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.alpha = visible ? kAlphaVisible : kAlphaInvisible;
                     }
                     completion:nil];
//                     completion:^(BOOL finished) {
//                         if (!visible) {
//                             [self.superview sendSubviewToBack:self];
//                         }
//                     }];
}

- (void)becomeVisible {
    self.visible = YES;
}

- (void)becomeInvisible {
    self.visible = NO;
}

@end
