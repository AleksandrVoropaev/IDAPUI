//
//  AVViewWithLoadingView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVViewWithLoadingView.h"

@implementation AVViewWithLoadingView

- (instancetype)init {
    self = [super init];
    self.loadingView = [AVLoadingView loadingViewForView:self];
    [self showLoadingView];
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.loadingView = [AVLoadingView loadingViewForView:self];
    [self showLoadingView];

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    self.loadingView = [AVLoadingView loadingViewForView:self];
    [self showLoadingView];

    return self;
}

- (void)showLoadingView {
    [self.loadingView becomeVisible];
}

- (void)hideLoadingView {
    [self.loadingView becomeInvisible];
}

@end
