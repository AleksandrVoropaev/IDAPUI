//
//  SqareView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVSquareMovingView.h"

typedef enum {
    AVSquareViewPositionTopLeft,
    AVSquareViewPositionTopRight,
    AVSquareViewPositionBottomRight,
    AVSquareViewPositionBottomLeft,
} AVSquareViewPositions;

@interface AVSquareView : AVSquareMovingView
@property (nonatomic, assign)   AVSquareViewPositions   position;

- (AVSquareViewPositions)nextSquarePosition;
- (AVSquareViewPositions)randomSquarePosition;
- (void)setSquarePosition:(AVSquareViewPositions)squarePosition;
- (void)setSquarePosition:(AVSquareViewPositions)squarePosition
                 animated:(BOOL)animated;
- (void)setSquarePosition:(AVSquareViewPositions)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler;
- (void)setRandomSquarePosition:(NSTimer *)timer;

@end
