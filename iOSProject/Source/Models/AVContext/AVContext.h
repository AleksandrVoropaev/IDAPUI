//
//  AVContext.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/31/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AVContext : NSObject

//ececute and cancel methods should be owerwritten in subclasses
- (void)execute;
- (void)cancel;

@end
