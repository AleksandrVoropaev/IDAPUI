//
//  AVRangeAlphabet.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVAlphabet.h"

@interface AVRangeAlphabet : AVAlphabet
@property (nonatomic, readonly) NSRange range;

- (instancetype)initWithRange:(NSRange)range;

@end
