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
@property (nonatomic, strong)   IBOutlet AVLoadingView  *loadingView;

- (void)showLoadingView;
- (void)hideLoadingView;

// Method to overwrite in subclasses if you want to use your own loading view. Returns actual loading view.
- (id)actualLoadingView;

@end
