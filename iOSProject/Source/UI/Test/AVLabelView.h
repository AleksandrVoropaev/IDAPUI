//
//  AVLabelView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 8/29/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVDraggableView;

@interface AVLabelView : UIView
@property (nonatomic, strong)   IBOutlet UILabel        *label;
@property (nonatomic, strong)   IBOutlet UIButton       *button;
@property (nonatomic, strong)   IBOutlet AVLabelView    *draggableView;

- (void)rotateView;

@end
