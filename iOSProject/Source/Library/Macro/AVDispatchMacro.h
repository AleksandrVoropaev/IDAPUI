//
//  AVDispatchMacro.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 11/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#include "AVWeakifyStrongify.h"

#define AVDispatchOnceMacro(variable, type, block) \
    static dispatch_once_t onceToken; \
    static type *variable = nil; \
    dispatch_once(&onceToken, ^{ \
        variable = block(); \
    }); \
    return variable;
