//
//  AVDraggableView.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 8/30/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVDraggableView.h"

#import <QuartzCore/QuartzCore.h>

static NSTimeInterval AVDuration = 1.0;

@interface AVDraggableView ()
@property (nonatomic, strong)   UITouch *leadingTouch;

//- (void)processTouches:(NSSet *)touches;
- (void)moveToLocation:(CGPoint)point;

@end

@implementation AVDraggableView


#pragma mark -
#pragma mark Initializations and Deallocations

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CALayer *layer = self.layer;
    layer.borderColor = [[UIColor blackColor] CGColor];
    layer.borderWidth = 2.0;
    layer.cornerRadius = CGRectGetWidth([self frame]) / 2;
}

- (void)setSquarePosition:(AVSqareViewPositions *)squarePosition {
    [self setSquarePosition:squarePosition animated:NO];
}

- (void)setSquarePosition:(AVSqareViewPositions *)squarePosition animated:(BOOL)animated {
    [self setSquarePosition:squarePosition animated:animated completionHandler:nil];
}

- (void)setSquarePosition:(AVSqareViewPositions *)squarePosition animated:(BOOL)animated completionHandler:(void(^)(void))handler {
    
    
    handler();
}

//- setSquarePosition, где бы устанавливалось значение из тайпдефа положений квадратика, и само положение квадратика менялось бы без анимации;
//- setSquarePosition:animated: , в котором бы при animated = YES происходила анимация от текущего положения квадратика к положению, определяемому передаваемым параметром squarePosition;
//- setSquarePosition:animated:completionHandler: , в котором бы при animated = YES происходила анимация от текущего положения квадратика к положению, определяемому передаваемым параметром squarePosition, а по завершении вызывался бы completionHandler;
//- должен происходить проброс от более простого проперти в более сложное, вся логика должна быть реализована в setSquarePosition:animated:completionHandler:;
//- новое состояние squarePosition должно быть установлено только по окончании анимации;
//- если до окончания предыдущей анимации будет установлена новая анимация, то новая анимация должна начаться от текущего положения квадратика;
//#pragma mark -
//#pragma mark Toches Handling
//
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"Began");
//    self.leadingTouch = [touches anyObject];
//    
//    [self processTouches:touches];
//}
//
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"Moved");
//    [self processTouches:touches];
//}
//
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"Ended");
//    [self processTouches:touches];
//    
//    self.leadingTouch = nil;
//}
//
//-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
//    NSLog(@"Cancelled");
//    [self processTouches:touches];
//    
//    self.leadingTouch = nil;
//}
//
//#pragma mark -
//#pragma mark Private
//
//- (void)processTouches:(NSSet *)touches {
//    if ([touches count] != AVTouchCount) {
//        return;
//    }
//    
//    UITouch *touch = self.leadingTouch;
//    CGPoint location = [touch locationInView:self.superview];
//    
//    CGFloat random = (CGFloat)arc4random() / UINT32_MAX;
//    CGFloat scale = random * 2 - 1;
//    
//    CGAffineTransform transform = CGAffineTransformIdentity;
////    transform = CGAffineTransformMakeScale(scale, scale);
//    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeScale(scale, scale));
//    transform = CGAffineTransformConcat(transform, CGAffineTransformMakeRotation(random * 2 * M_PI));
//    
//    CGRect frame = self.frame;
//    frame.origin = location;
//
////    [UIView animateWithDuration:AVDuration animations:^{
////        self.frame = frame;
////        self.transform = transform;
////    }];
//
//    [UIView animateWithDuration:AVDuration
//                          delay:0
//                        options:UIViewAnimationOptionBeginFromCurrentState
//                     animations:^{
//                         self.frame = frame;
//                         self.transform = transform;
//                     }
//                     completion:nil];
//    
//}

- (IBAction)onPan:(UIGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateChanged) {
        [self moveToLocation:[sender locationInView:self.superview]];
    }
}

- (void)moveToLocation:(CGPoint)location {
    CGRect frame = self.frame;
    CGFloat dimention = location.x / 50;
    frame.size = CGSizeMake(dimention, dimention);
    
    [UIView animateWithDuration:AVDuration
                     animations:^{
                         self.frame = frame;
                     }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.layer.cornerRadius = CGRectGetWidth(self.frame) / 2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
