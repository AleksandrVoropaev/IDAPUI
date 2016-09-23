//
//  NSMutableArray+AVExtensions.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/23/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (AVExtensions)

- (void)moveObjectFromIndex:(NSUInteger)baseIndex toIndex:(NSUInteger)targetIndex;

@end
