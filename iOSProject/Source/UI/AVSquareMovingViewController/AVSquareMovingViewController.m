//
//  AVSquareMovingViewController.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSquareMovingViewController.h"

#import "AVRootViewMacro.h"

const NSTimeInterval kAVTimeInterval = .5;

AVRootViewPrivateInterfaceWithDynamicProperty(AVSquareMovingViewController, AVSquareMovingView, squareMovingView)

@implementation AVSquareMovingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onNextButton:(id)sender {
    [self.squareMovingView.squareView moveToNextSquarePositionAnimated:YES];
}

- (IBAction)onRandomButton:(id)sender {
    [self moveToRandomSquarePositionAnimated:YES];
}

- (IBAction)onRunButton:(id)sender {
//    self.squareMovingView.runButton.hidden = YES;
    self.squareMovingView.squareView.looping = YES;
}

- (IBAction)onStopButton:(id)sender {
    self.squareMovingView.squareView.looping = NO;
//    self.squareMovingView.runButton.hidden = NO;
}

- (void)moveToRandomSquarePositionAnimated:(BOOL)animated {
    [self.squareMovingView.squareView moveToRandomSquarePositionAnimated:animated];
}

@end
