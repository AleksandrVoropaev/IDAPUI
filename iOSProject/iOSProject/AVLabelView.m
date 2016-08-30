//
//  AVLabelView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 8/29/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVLabelView.h"

@implementation AVLabelView

#pragma mark -
#pragma mark Public

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    self.label.text = @"Yoou-hoou!";
}

- (void)rotateView {
    self.label.transform = CGAffineTransformMakeRotation((float)arc4random() / UINT32_MAX * 2 * M_PI);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
