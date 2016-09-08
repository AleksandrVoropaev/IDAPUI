//
//  AVCompilerMacro.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

//#define AVClang "clang"
//#define AVDiagnostic "diagnostic"
//#define AVPush "push"
//#define AVPop "pop"
//
//#define AVClangDiagnosticPragma(action) _Pragma(AVClang" "AVDiagnostic" "action);
//#define AVClangDiagnosticPushPragma AVClangDiagnosticPragma(AVPush)
//#define AVClangDiagnosticPopPragma AVClangDiagnosticPragma(AVPop)

#define AVClangDiagnosticPushPragma _Pragma("clang diagnostic push");
#define AVClangDiagnosticPopPragma _Pragma("clang diagnostic pop");
#define AVClangDiagnosticIgnoredPragma(key) _Pragma("clang diagnostic ignored \"key\""); \

#define AVClangDiagnosticPushIgnoredPragma(key) \
    AVClangDiagnosticPushPragma \
    AVClangDiagnosticIgnoredPragma(key)

#define AVClangDiagnosticPopIgnoredPragma AVClangDiagnosticPopPragma

//_Pragma("clang diagnostic ignored \"-Wshadow\""); \
//__strong __typeof(object) object = __AVWeakified_##object; \
