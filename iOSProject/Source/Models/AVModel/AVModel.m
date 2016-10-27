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
    @synchronized (self) {
        NSInteger state = self.state;
        if (state == AVModelStateDidUnload || state == AVModelStateDidFailLoading) {
            self.state = AVModelStateWillLoad;
            AVDispatchAsyncBlockOnDefaultPriorityQueue(^{
                [self performLoading];
            });
        } else {
            [self notifyOfState:state];
        }
    }
}

- (void)performLoading {
    
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        AVSwitchCase(AVModelStateDidLoad, { return @selector(modelDidLoad:); });
        AVSwitchCase(AVModelStateWillLoad, { return @selector(modelWillLoad:); });
        AVSwitchCase(AVModelStateDidUnload, { return @selector(modelDidUnload:); });
        AVSwitchCase(AVModelStateDidFailLoading, { return @selector(modelDidFailLoading:); });
        AVSwitchCaseDefault({ return [super selectorForState:state]; });
    }
}

@end
