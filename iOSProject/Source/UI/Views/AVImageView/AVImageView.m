//
//  AVImageView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVImageView.h"

//#import "AVObservableObject.h"

@interface AVImageView ()
//@property (nonatomic, strong)   AVObservableObject  *observer;

- (void)initSubviews;

@end

@implementation AVImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
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
    if (_contentImageView != contentImageView)
    {
        [_contentImageView removeFromSuperview];
        _contentImageView = contentImageView;
        [self addSubview:_contentImageView];
    }
}

- (void)setImageModel:(AVImageView *)imageModel {
    if (_imageModel != imageModel) {
        _imageModel = imageModel;
    }
}

#pragma mark -
#pragma mark View Lifecycle


#pragma mark -
#pragma mark Private


@end
