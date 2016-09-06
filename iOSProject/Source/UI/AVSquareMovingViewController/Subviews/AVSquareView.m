//
//  SqareView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSquareView.h"

#import "AVSwitchCaseMacro.h"
#import "AVCGRectMacro.h"

const NSTimeInterval kAVTimeInteerval = .7;

@interface AVSquareView ()
@property (nonatomic, assign)   BOOL    running;

- (CGPoint)originWithSquarePosition:(AVSquareViewPosition)squarePosition;
- (AVSquareViewPosition)nextSquarePosition;
- (AVSquareViewPosition)randomSquarePosition;
- (void)performAnimation;

@end

@implementation AVSquareView

#pragma mark -
#pragma mark Accessors

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
    if (_squarePosition == squarePosition) {
        return;
    }
    
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
                         if (handler && self.running) {
                             handler(finished);
                         }
                     }];
}

- (void)setLooping:(BOOL)looping {
    if (_looping != looping) {
        _looping = looping;
    }
    
    if (looping && !self.running) {
        [self performAnimation];
    }
}

#pragma mark -
#pragma mark Public

- (void)moveToRandomSquarePositionAnimated:(BOOL)animated {
    [self setSquarePosition:[self randomSquarePosition] animated:animated];
}

- (void)moveToNextSquarePositionAnimated:(BOOL)animated {
    [self setSquarePosition:[self nextSquarePosition] animated:animated];
}

#pragma mark -
#pragma mark Private

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
    }
    
    return origin;
}

- (AVSquareViewPosition)nextSquarePosition {
    return (self.squarePosition + 1) % AVSquareViewPositionCount;
}

- (AVSquareViewPosition)randomSquarePosition {
    AVSquareViewPosition randomPosition = AVSquareViewPositionTopLeft;
    do {
        randomPosition = arc4random_uniform(AVSquareViewPositionCount);
    } while (randomPosition == self.squarePosition);
    
    return randomPosition;
}

- (void)performAnimation {
    self.running = YES;
    __weak typeof(self) weakSelf = self;
    [self setSquarePosition:[self randomSquarePosition]
                   animated:YES
          completionHandler:^(BOOL finished) {
              __strong typeof(weakSelf) strongSelf = weakSelf;
              strongSelf.running = NO;
              if (strongSelf.looping) {
                  [strongSelf performAnimation];
              }
          }];
}

@end
