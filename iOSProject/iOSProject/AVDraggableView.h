//
//  AVDraggableView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 8/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVLabelView.h"

typedef enum {
    AVSqareViewTopLeftPositions,
    AVSqareViewTopRightPositions,
    AVSqareViewBottomRightPositions,
    AVSqareViewBottomLeftPositions,
} AVSqareViewPositions;

@interface AVDraggableView : AVLabelView
@property (nonatomic, assign)   AVSqareViewPositions    *squarePosition;
@property (nonatomic, strong)   IBOutlet UIGestureRecognizer *recognizer;

- (void)setSquarePosition:(AVSqareViewPositions *)squarePosition animated:(BOOL)animated completionHandler:(void(^)(void))handler;
- (IBAction)onPan:(id)sender;

@end
