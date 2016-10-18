//
//  AVModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/18/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVModel.h"

#import "AVSwitchCaseMacro.h"

@implementation AVModel

- (void)load {
    
}

- (void)save {
    
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        AVSwitchCase(AVModelStateLoaded, { return @selector(modelDidLoaded); });
        AVSwitchCase(AVModelStateLoading, { return @selector(modelIsLoading); });
        AVSwitchCase(AVModelStateNotLoaded, { return @selector(modelNotLoaded); });
        AVSwitchCase(AVModelStateFailedLoading, { return @selector(modelDidFailedLoading); });
        AVSwitchCaseDefault({ return [super selectorForState:state]; });
    }
}

@end
