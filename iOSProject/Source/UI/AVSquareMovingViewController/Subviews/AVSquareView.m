//
//  SqareView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSquareView.h"

const NSTimeInterval kAVTimeInteerval = 7;

@interface AVSquareView ()

- (AVSquareViewPosition)nextSquarePosition;
- (AVSquareViewPosition)randomSquarePosition;

@end

@implementation AVSquareView

- (AVSquareViewPosition)nextSquarePosition {
    return (self.squarePosition + 1) % AVSquareViewPositionCount;
}

- (AVSquareViewPosition)randomSquarePosition {
    AVSquareViewPosition randomPosition = AVSquareViewPositionTopLeft;
    do {
        randomPosition = arc4random() % AVSquareViewPositionCount;
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

- (void)setLooping:(BOOL)looping {
    if (_looping != looping) {
        _looping = looping;
    }
    
    if (looping) {
        [self performAnimation];
    }
}

- (void)performAnimation {
    [self setSquarePosition:[self randomSquarePosition]
                   animated:YES
          completionHandler:^(BOOL finished) {
//          completionHandler:^() {
              if (self.looping) {
                  [self performAnimation];
              }
          }];
}

- (void)setSquarePosition:(AVSquareViewPosition)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler
//        completionHandler:(void(^)(void))handler
{
    if (_squarePosition == squarePosition) {
        return;
    }
//    if (handler) {
//        handler();
//    }
   
    [UIView animateWithDuration:animated ? kAVTimeInteerval : 0
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         CGRect frame = self.frame;
                         frame.origin = [self originWithSquarePosition:squarePosition];
                         self.frame = frame;
                     }
                     completion: ^(BOOL finished) {
                         _squarePosition = squarePosition;
                             if (handler) {
                                 handler(finished);
                             }
                     }];
}

- (CGPoint)originWithSquarePosition:(AVSquareViewPosition)squarePosition {
    CGRect bounds = self.superview.bounds;
    CGRect frame = self.frame;
    CGPoint maxOrigin = CGPointMake(CGWidth(bounds) - CGWidth(frame),
                                    CGHeight(bounds) - CGHeight(frame));
    CGPoint origin = CGPointZero;
    switch (squarePosition) {
        AVSwitchCase(AVSquareViewPositionTopRight, { origin.x = maxOrigin.x; })
        AVSwitchCase(AVSquareViewPositionBottomRight, { origin = maxOrigin; })
        AVSwitchCase(AVSquareViewPositionBottomLeft, { origin.y = maxOrigin.y; })
        AVSwitchCaseDefault()

//        case AVSquareViewPositionTopRight:
//            origin.x = maxOrigin.x;
//            break;
//            
//        case AVSquareViewPositionBottomRight:
//            origin = maxOrigin;
//            break;
//            
//        case AVSquareViewPositionBottomLeft:
//            origin.y = maxOrigin.y;
//            break;
//            
//        default:
//            break;
    }
    
    return origin;
}

- (void)moveToRandomSquarePositionAnimated:(BOOL)animated {
    [self setSquarePosition:[self randomSquarePosition] animated:animated];
}

- (void)moveToNextSquarePositionAnimated:(BOOL)animated {
    [self setSquarePosition:[self nextSquarePosition] animated:animated];
}

@end
