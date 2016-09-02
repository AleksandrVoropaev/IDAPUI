//
//  AVSquareMovingView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AVSquareView;

@interface AVSquareMovingView : UIView
@property (nonatomic, strong)   IBOutlet AVSquareView   *squareView;
@property (nonatomic, strong)   IBOutlet UIButton       *nextButton;
@property (nonatomic, strong)   IBOutlet UIButton       *randomButton;

@end
