//
//  AVBlockMacro.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/3/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#define AVPerformBlock(block) \
    AVPerformBlockWithArguments(block);

#define AVPerformBlockWithArguments(block, ...) \
    if (block) { \
        block(__VA_ARGS__); \
    }
