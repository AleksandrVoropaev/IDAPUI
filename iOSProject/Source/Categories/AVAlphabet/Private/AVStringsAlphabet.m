//
//  AVStringsAlphabet.m
//  ObjectiveC
//
//  Created by Aleksandr Voropaev on 7/14/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVStringsAlphabet.h"

@interface AVStringsAlphabet ()
@property (nonatomic, assign) NSArray *strings;

@end

@implementation AVStringsAlphabet

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.strings = nil;
    
//    [super dealloc];
}

- (instancetype)initWithStrings:(NSArray *)strings {
    self = [super init];
    if (self) {
        self.strings = strings;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSUInteger)count {
    return [self.strings count];
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return self.strings[index];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained _Nonnull [])stackbuf
                                    count:(NSUInteger)len
{
    return [self.strings countByEnumeratingWithState:state
                                             objects:stackbuf
                                               count:len];
}

@end
