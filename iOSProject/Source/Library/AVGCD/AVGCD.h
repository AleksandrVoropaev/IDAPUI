//
//  AVGrandCentralDispatch.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 8/25/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

typedef enum {
    AVDispatchQueueHighPriority = QOS_CLASS_USER_INTERACTIVE,
    AVDispatchQueueDefaultPriority = QOS_CLASS_USER_INITIATED,
    AVDispatchQueueLowPriority = QOS_CLASS_UTILITY,
    AVDispatchQueueBackgroundPriority = QOS_CLASS_BACKGROUND,
    AVDispatchQueueUIPriority,
} AVDispatchQueuePriorityType;

dispatch_queue_t AVDispatchQueueWithPriority(AVDispatchQueuePriorityType type);

void AVDispatchAsyncBlockOnMainQueue(void(^block)(void));
void AVDispatchSyncBlockOnMainQueue(void(^block)(void));

void AVDispatchAsyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void));
void AVDispatchSyncBlockOnQueueWithType(AVDispatchQueuePriorityType type, void(^block)(void));

void AVDispatchAsyncBlockOnHighPriorityQueue(void(^block)(void));
void AVDispatchSyncBlockOnHighPriorityQueue(void(^block)(void));

void AVDispatchAsyncBlockOnDefaultPriorityQueue(void(^block)(void));
void AVDispatchSyncBlockOnDefaultPriorityQueue(void(^block)(void));

void AVDispatchAsyncBlockOnLowPriorityQueue(void(^block)(void));
void AVDispatchSyncBlockOnLowPriorityQueue(void(^block)(void));

void AVDispatchAsyncBlockOnBackgroundPriorityQueue(void(^block)(void));
void AVDispatchSyncBlockOnBackgroundPriorityQueue(void(^block)(void));
