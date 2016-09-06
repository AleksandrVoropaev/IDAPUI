//
//  SqareView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVSquareMovingView.h"

#define CGWidth CGRectGetWidth
#define CGHeight CGRectGetHeight

#define AVSwitchCase(value, code) case value: { code } break;
#define AVSwitchCaseDefault(code) default: { code } break;

typedef enum {
    AVSquareViewPositionTopLeft,
    AVSquareViewPositionTopRight,
    AVSquareViewPositionBottomRight,
    AVSquareViewPositionBottomLeft,
    AVSquareViewPositionCount,
} AVSquareViewPosition;

@interface AVSquareView : AVSquareMovingView
@property (nonatomic, assign)   AVSquareViewPosition    squarePosition;
- (void)setSquarePosition:(AVSquareViewPosition)squarePosition
                 animated:(BOOL)animated;
- (void)setSquarePosition:(AVSquareViewPosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler;

@property (nonatomic, assign)   BOOL                    looping;

- (void)moveToRandomSquarePositionAnimated:(BOOL)animated;
- (void)moveToNextSquarePositionAnimated:(BOOL)animated;

@end
