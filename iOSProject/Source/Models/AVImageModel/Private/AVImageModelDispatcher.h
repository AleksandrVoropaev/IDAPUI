//
//  AVImageModelDispatcher.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/7/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVImageModelDispatcher : NSObject
@property (nonatomic, readonly)     NSOperationQueue    *queue;

+ (instancetype)sharedDispatcher;

@end
