//
//  AVRandom.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/4/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#include <stdlib.h>
#include <Foundation/Foundation.h>

#include "AVRandom.h"

uint32_t AVRandomWithRange(uint32_t firstValue, uint32_t secondValue) {
    uint32_t minValue = MIN(firstValue, secondValue);
    uint32_t maxValue = MAX(firstValue, secondValue);
        
    return arc4random_uniform(maxValue - minValue) + minValue;
}

uint32_t AVRandomWithValue(uint32_t value) {
    return AVRandomWithRange(0, value);
}
