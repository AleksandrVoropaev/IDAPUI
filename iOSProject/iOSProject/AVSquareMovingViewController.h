//
//  AVSquareMovingViewController.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/1/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVSquareView.h"

#define AVViewPropertyWithType(propertyType, viewClassName, viewPropertyName) \
    @property (nonatomic, propertyType) viewClassName *viewPropertyName;

#define AVViewStrongProperty(viewClassName, viewPropertyName) \
    AVViewPropertyWithType(strong, viewClassName, viewPropertyName)

#define AVViewReadonlyProperty(viewClassName, viewPropertyName) \
    AVViewPropertyWithType(readonly, viewClassName, viewPropertyName)


#define AVViewGetter(viewClassName, getterName) \
    - (viewClassName *)viewPropertyName { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClassName class]]) { \
            return (viewClassName *)self.view; \
        } \
        return nil; \
    }

#define AVViewPrivateInterfaceWithDynamicProperty(interfaceName, viewClassName, viewPropertyName) \
    @interface interfaceName () \
    AVViewStrongProperty(viewClassName, viewPropertyName); \
    @end \
    @implementation interfaceName \
    @dynamic viewPropertyName; \
    @end

@interface AVSquareMovingViewController : UIViewController
//@property (nonatomic, readonly) AVSquareMovingView  *squareMovingView;
AVViewReadonlyProperty(AVSquareMovingView, squareMovingView);

- (IBAction)onNextButton:(id)sender;
- (IBAction)onRandomButton:(id)sender;

- (IBAction)onRunButton:(id)sender;
- (IBAction)onStopButton:(id)sender;

@end
