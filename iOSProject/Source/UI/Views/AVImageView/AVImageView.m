//
//  AVImageView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVImageView.h"

#import "AVImageModel.h"
#import "AVGCD.h"

@interface AVImageView ()

- (void)initSubviews;

@end

@implementation AVImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self initSubviews];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.loadingView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    self.loadingView.activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;

    if (!self.contentImageView) {
        [self initSubviews];
    }
}

- (void)initSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
                                | UIViewAutoresizingFlexibleWidth
                                | UIViewAutoresizingFlexibleRightMargin
                                | UIViewAutoresizingFlexibleTopMargin
                                | UIViewAutoresizingFlexibleHeight
                                | UIViewAutoresizingFlexibleBottomMargin;
    
    self.contentImageView = imageView;
}

#pragma mark -
#pragma mark Accessors

- (void)setContentImageView:(UIImageView *)contentImageView {
    if (_contentImageView != contentImageView) {
        [_contentImageView removeFromSuperview];
        
        _contentImageView = contentImageView;
        
        [self addSubview:_contentImageView];
    }
}

- (void)setImageModel:(AVImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        _imageModel = imageModel;
        [_imageModel addObserver:self];
        
        [imageModel load];
    }
}

#pragma mark -
#pragma mark View Lifecycle


#pragma mark -
#pragma mark Private

#pragma mark -
#pragma mark Image Model Observation

- (void)modelWillLoad:(AVModel *)model {
    if (model == self.imageModel) {
        AVDispatchAsyncBlockOnMainQueue(^{
            [self showLoadingView];
        });
    }
}

- (void)modelDidLoad:(AVImageModel *)model {
    if (model == self.imageModel) {
        AVDispatchAsyncBlockOnMainQueue(^{
            self.contentImageView.image = model.image;
            [self hideLoadingView];
        });
    }
}

- (void)modelDidFailLoading:(AVModel *)model {
    if (model == self.imageModel) {
        [self.imageModel load];
    }
}

- (void)modelDidUnload:(AVModel *)model {
    if (model == self.imageModel) {
        AVDispatchAsyncBlockOnMainQueue(^{
            self.contentImageView.image = nil;
        });
    }
}

@end
