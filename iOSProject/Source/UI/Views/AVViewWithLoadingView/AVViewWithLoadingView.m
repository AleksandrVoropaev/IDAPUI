//
//  AVViewWithLoadingView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVViewWithLoadingView.h"

@implementation AVViewWithLoadingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (!self.loadingView) {
        self.loadingView = [AVLoadingView loadingViewForView:self];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        self.loadingView = [AVLoadingView loadingViewForView:self];
    }
}

- (void)showLoadingView {
    [self.loadingView becomeVisible];
}

- (void)hideLoadingView {
    [self.loadingView becomeInvisible];
}

@end
