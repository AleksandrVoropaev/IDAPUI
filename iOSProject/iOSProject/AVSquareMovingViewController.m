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

@end

@implementation AVSquareMovingViewController

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
    [self.squareMovingView.squareView setNextSquarePositionAnimated:YES];
}

- (IBAction)onRandomButton:(id)sender {
    [self setRandomSquarePositionAnimated:YES];
}

- (IBAction)onRunButton:(id)sender {
    self.squareMovingView.squareView.looping = YES;
    [self setRandomSquarePositionAnimated:YES];
}

- (IBAction)onStopButton:(id)sender {
    self.squareMovingView.squareView.looping = NO;
}

- (void)setRandomSquarePositionAnimated:(BOOL)animated {
    [self.squareMovingView.squareView setRandomSquarePositionAnimated:animated];
}

@end
