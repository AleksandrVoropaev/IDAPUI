//
//  AVSquareMovingViewController.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVSquareView.h"

@interface AVSquareMovingViewController : UIViewController

- (IBAction)onNextButton:(id)sender;
- (IBAction)onRandomButton:(id)sender;

- (IBAction)onRunButton:(id)sender;
- (IBAction)onStopButton:(id)sender;

@end
