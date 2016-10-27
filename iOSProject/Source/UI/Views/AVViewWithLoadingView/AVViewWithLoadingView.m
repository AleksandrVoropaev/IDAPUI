//
//  AVViewWithLoadingView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVViewWithLoadingView.h"

@implementation AVViewWithLoadingView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.loadingView = [self actualLoadingView];

    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setLoadingView:(AVLoadingView *)loadingView {
    if (loadingView != _loadingView) {
        [_loadingView removeFromSuperview];
        _loadingView = loadingView;
        [self addSubview:_loadingView];
//        [self bringSubviewToFront:_loadingView];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        self.loadingView = [self actualLoadingView];
    }
}

#pragma mark -
#pragma mark Public

- (void)showLoadingView {
    self.loadingView.visible = YES;
}

- (void)hideLoadingView {
    self.loadingView.visible = NO;
}

- (id)actualLoadingView {
    return [AVLoadingView loadingViewForView:self];
}

@end
