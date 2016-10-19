//
//  AVModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVModel.h"

#import "AVSwitchCaseMacro.h"
#import "AVGCD.h"

@implementation AVModel

- (void)load {
    NSInteger state = self.state;
    if (state == AVModelStateUnloaded || state == AVModelStateFailedLoading) {
//        AVDispatchAsyncBlockOnDefaultPriorityQueue(^{
//            [self performLoading];
//            AVDispatchAsyncBlockOnMainQueue(^{
//                [self notifyOfState:AVModelStateLoading];
//            });
//        });
        [self performLoading];
        [self notifyOfState:AVModelStateLoading];
    }
}

- (void)performLoading {
    
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        AVSwitchCase(AVModelStateLoaded, { return @selector(modelDidLoad:); });
        AVSwitchCase(AVModelStateLoading, { return @selector(modelWillLoad:); });
        AVSwitchCase(AVModelStateUnloaded, { return @selector(modelDidUnload:); });
        AVSwitchCase(AVModelStateFailedLoading, { return @selector(modelDidFailLoading:); });
        AVSwitchCaseDefault({ return [super selectorForState:state]; });
    }
}

@end
