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
    self.loadingView = [self actualLoadingView];

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];

    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    if (!self.loadingView) {
        self.loadingView = [self actualLoadingView];
    }
}

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
