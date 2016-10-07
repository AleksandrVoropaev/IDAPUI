//
//  AVGrandCentralDispatch.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/25/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVGCD.h"

dispatch_queue_t AVDispatchQueueWithPriority(AVDispatchQueuePriorityType type) {
    if (type == AVDispatchQueueUIPriority) {
        return dispatch_get_main_queue();
    }
    
    return dispatch_get_global_queue(type, 0);
}

void AVDispatchAsyncBlockOnMainQueue(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(AVDispatchQueueWithPriority(AVDispatchQueueUIPriority), block);
}

void AVDispatchSyncBlockOnMainQueue(void(^block)(void)) {
    if (!block) {
        return;
    }
    
    if ([NSThread isMainThread]) {
        block();
    } else {
        dispatch_sync(dispatch_get_main_queue(), block);
    }
}

void AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_async(AVDispatchQueueWithPriority(type), block);
}

void AVDispatchSyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void)) {
    if (!block) {
        return;
    }
    
    dispatch_sync(AVDispatchQueueWithPriority(type), block);
}

void AVDispatchAsyncBlockOnHighPriorityQueue(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueHighPriority, block);
}

void AVDispatchSyncBlockOnHighPriorityQueue(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueHighPriority, block);
}

void AVDispatchAsyncBlockOnDefaultPriorityQueue(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueDefaultPriority, block);
}

void AVDispatchSyncBlockOnDefaultPriorityQueue(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueDefaultPriority, block);
}

void AVDispatchAsyncBlockOnLowPriorityQueue(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueLowPriority, block);
}

void AVDispatchSyncBlockOnLowPriorityQueue(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueLowPriority, block);
}

void AVDispatchAsyncBlockOnBackgroundPriorityQueue(void(^block)(void)) {
    AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueueBackgroundPriority, block);
}

void AVDispatchSyncBlockOnBackgroundPriorityQueue(void(^block)(void)) {
    AVDispatchSyncBlockOnQueueWithType(AVDispatchQueueBackgroundPriority, block);
}
