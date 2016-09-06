//
//  AVStringsAlphabet.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVAlphabet.h"

@interface AVStringsAlphabet : AVAlphabet
@property (nonatomic, readonly) NSArray *strings;

- (instancetype)initWithStrings:(NSArray *)strings;

@end
