//
//  AVViewWithLoadingView.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVLoadingView.h"

@interface AVViewWithLoadingView : UIView
@property (nonatomic, strong)   AVLoadingView   *loadingView;

- (void)showLoadingView;
- (void)hideLoadingView;
- (id)actualLoadingView;

@end
