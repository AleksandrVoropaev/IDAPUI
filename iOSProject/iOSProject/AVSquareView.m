//
//  SqareView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSquareView.h"

@implementation AVSquareView

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    
//    [self setPosition:AVSquareViewPositionTopLeft];
//}

- (AVSquareViewPositions)nextSquarePosition {
    AVSquareViewPositions position = self.position;
    if (position == AVSquareViewPositionBottomLeft) {
        self.position = AVSquareViewPositionTopLeft;
        return AVSquareViewPositionTopLeft;
    }
    
//    self.position = ++position;
//    return position;
    return ++position;
}

- (AVSquareViewPositions)randomSquarePosition {
    AVSquareViewPositions randomPosition;
    do {
        randomPosition = arc4random() % 4;
    } while (randomPosition == self.position);
    
//    self.position = randomPosition;
    return randomPosition;
}

- (void)setSquarePosition:(AVSquareViewPositions)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(AVSquareViewPositions)squarePosition
                 animated:(BOOL)animated
{
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(AVSquareViewPositions)squarePosition
                 animated:(BOOL)animated
        completionHandler:(void(^)(BOOL finished))handler
{
    CGPoint location;
    CGFloat width = self.superview.frame.size.width - self.frame.size.width;
    CGFloat height = self.superview.frame.size.height - self.frame.size.width;
    switch (squarePosition) {
        case AVSquareViewPositionTopLeft:
            location = CGPointMake(0, 0);
            break;
        case AVSquareViewPositionTopRight:
            location = CGPointMake(width, 0);
            break;
        case AVSquareViewPositionBottomRight:
            location = CGPointMake(width, height);
            break;
        case AVSquareViewPositionBottomLeft:
            location = CGPointMake(0, height);
            break;

        default:
            break;
    }
    
    CGRect frame = self.frame;
    frame.origin = location;
    
    [UIView animateWithDuration:0.1
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         self.frame = frame;
                     }
                     completion:handler];
    self.position = squarePosition;
}

@end
