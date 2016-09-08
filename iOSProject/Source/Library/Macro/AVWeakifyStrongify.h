//
//  AVWeakifyStrongify.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#include "AVCompilerMacro.h"

#define AVWeakify(object) \
    __weak __typeof(object) __AVWeakified_##object = object;

// You should call this method ONLY after you called AVWeakify method with the same object
#define AVStrongify(object) \
    AVClangDiagnosticPushIgnoredPragma(-Wshadow) \
    __strong __typeof(object) object = __AVWeakified_##object; \
    AVClangDiagnosticPopIgnoredPragma

//#define AVStrongify(object) \
//    _Pragma("clang diagnostic push"); \
//    _Pragma("clang diagnostic ignored \"-Wshadow\""); \
//    __strong __typeof(object) object = __AVWeakified_##object; \
//    _Pragma("clang diagnostic pop");

#define AVEmptyResult

#define AVStrongifyAndReturnResultIfNil(object, result) \
    AVStrongify(object) \
    if (!object) { \
        return result; \
    }

#define AVStrongifyAndReturnIfNil(object) \
    AVStrongifyAndReturnResultIfNil(object, AVEmptyResult)

#define AVStrongifyAndReturnNilIfNil(object) \
    AVStrongifyAndReturnResultIfNil(object, nil)


