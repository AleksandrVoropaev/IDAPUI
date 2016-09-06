//
//  AVClusterAlphabet.h
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVAlphabet.h"

@interface AVClusterAlphabet : AVAlphabet
@property (nonatomic, readonly) NSArray *alphabets;

- (instancetype)initWithAlphabets:(NSArray *)alphabets;

@end
