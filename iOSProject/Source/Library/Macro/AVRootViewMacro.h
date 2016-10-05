//
//  AVRootViewMacro.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#define AVRootViewProperty(viewClass, viewProperty) \
    @property (nonatomic, readonly) viewClass *viewProperty;

#define AVRootViewGetter(viewClass, propertyName) \
    @dynamic propertyName; \
    - (viewClass *)propertyName { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        return nil; \
    }

#define AVRootViewPrivateInterfaceWithDynamicProperty(viewControllerClass, viewClass, propertyName) \
    @interface viewControllerClass (__AVViewControllerRootView_##viewControllerClass##_##viewClass##_##propertyName) \
    AVRootViewProperty(viewClass, propertyName); \
    @end \
    @implementation viewControllerClass (__AVViewControllerRootView_##viewControllerClass##_##viewClass##_##propertyName) \
    AVRootViewGetter(viewClass, propertyName) \
    @end
