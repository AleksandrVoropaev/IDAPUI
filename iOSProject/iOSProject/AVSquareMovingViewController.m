//
//  AVSquareMovingViewController.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSquareMovingViewController.h"

const NSTimeInterval kAVTimeInterval = .5;

@interface AVSquareMovingViewController ()
@property (nonatomic, readonly) AVSquareMovingView  *squareMovingView;
@property (nonatomic, assign)   NSTimer             *timer;

@end

@implementation AVSquareMovingViewController

-(void)setTimer:(NSTimer *)timer {
    if (_timer != timer) {
        [_timer invalidate];
        _timer = timer;
    }
}

- (AVSquareMovingView *)squareMovingView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[AVSquareMovingView class]]) {
        return (AVSquareMovingView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onNextButton:(id)sender {
    [self.squareMovingView.squareView setSquarePosition:[self.squareMovingView.squareView nextSquarePosition] animated:YES];
}

- (IBAction)onRandomButton:(id)sender {
    [self.squareMovingView.squareView setSquarePosition:[self.squareMovingView.squareView randomSquarePosition] animated:YES];
}

- (IBAction)onRunButton:(id)sender {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:kAVTimeInterval
                                                  target:self.squareMovingView.squareView
                                                selector:@selector(setRandomSquarePosition:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (IBAction)onStopButton:(id)sender {
    self.timer = nil;
}

@end
