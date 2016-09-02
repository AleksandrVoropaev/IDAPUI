//
//  SqareView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSquareView.h"

const NSTimeInterval kAVTimeInteerval = 0.2;

@implementation AVSquareView

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    
//    [self setPosition:AVSquareViewPositionTopLeft];
//}

- (AVSquareViewPosition)nextSquarePosition {
    AVSquareViewPosition position = self.squarePosition;
    if (position == AVSquareViewPositionBottomLeft) {
        self.squarePosition = AVSquareViewPositionTopLeft;
        
        return AVSquareViewPositionTopLeft;
    }
    
    return ++position;
}

- (AVSquareViewPosition)randomSquarePosition {
    AVSquareViewPosition randomPosition;
    do {
        randomPosition = arc4random() % 4;
    } while (randomPosition == self.squarePosition);
    
    return randomPosition;
}

- (void)setSquarePosition:(AVSquareViewPosition)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(AVSquareViewPosition)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(AVSquareViewPosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler
{
    CGRect frame = self.frame;
    frame.origin = [self squareLocationWithPosition:squarePosition];
    
    __block BOOL looping = self.looping;
    
    void(^animationCompletion)(BOOL finished) = ^(BOOL finished) {
        _squarePosition = squarePosition;
        if (looping) {
            [self setSquarePosition:squarePosition animated:animated completionHandler:handler];
        }
        
        if (handler) {
            handler(finished);
        }
    };
    
    if (animated) {
        [UIView animateWithDuration:kAVTimeInteerval
                              delay:0
                            options:UIViewAnimationOptionBeginFromCurrentState
                         animations:^{
                             self.frame = frame;
                         }
                         completion:animationCompletion];
    } else {
        self.frame = frame;
        animationCompletion(NO);
    }
}

- (CGPoint)squareLocationWithPosition:(AVSquareViewPosition)squarePosition {
    CGRect superviewBounds = self.superview.bounds;
    CGRect selfFrame = self.frame;
    CGFloat maxXLocation = CGRectGetWidth(superviewBounds) - CGRectGetWidth(selfFrame);
    CGFloat maxYLocation = CGRectGetHeight(superviewBounds) - CGRectGetHeight(selfFrame);
    switch (squarePosition) {
        case AVSquareViewPositionTopRight:
            return CGPointMake(maxXLocation, 0);
            
        case AVSquareViewPositionBottomRight:
            return CGPointMake(maxXLocation, maxYLocation);

        case AVSquareViewPositionBottomLeft:
            return CGPointMake(0, maxYLocation);
            
        default:
            break;
    }
    
    return CGPointMake(0, 0);
    
//    float x = 0;
//    float y = 0;
//    switch (squarePosition) {
//        case AVSquareViewPositionTopRight:
//            x = maxXLocation;
//            break;
//            
//        case AVSquareViewPositionBottomRight:
//            x = maxXLocation;
//            y = maxYLocation;
//            break;
//            
//        case AVSquareViewPositionBottomLeft:
//            y = maxYLocation;
//            break;
//            
//        default:
//            break;
//    }
//    
//    return CGPointMake(x, y);
}

- (void)setRandomSquarePositionAnimated:(BOOL)animated {
    [self setSquarePosition:[self randomSquarePosition] animated:animated];
}

- (void)setNextSquarePositionAnimated:(BOOL)animated {
    [self setSquarePosition:[self nextSquarePosition] animated:animated];
}

@end
