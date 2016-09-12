//
//  AVArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/12/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayModel.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayModel ()
@property (nonatomic, strong)   NSArray     *array;

@end

@implementation AVArrayModel

@dynamic count;

- (NSUInteger)count {
    return self.array.count;
}

- (void)addObject:(id)object {
    NSMutableArray *result = [NSMutableArray arrayWithArray:self.array];
    [result addObject:object];
    self.array = result;
}

- (void)addObject:(id)object atIndex:(NSUInteger)index {
    NSMutableArray *result = nil;
    for (NSUInteger iterator = 0; iterator < index + 1; iterator++) {
        [result addObject:self.array[iterator]];
    }

    [result addObject:object];
    
    for (NSUInteger iterator = index + 1; iterator < self.array.count; iterator++) {
        [result addObject:self.array[iterator]];
    }

    self.array = result;
}

- (void)addObjects:(NSArray *)objects {
    NSMutableArray *result = [NSMutableArray arrayWithArray:self.array];
    [result addObjectsFromArray:objects];
    self.array = result;
}

- (void)removeObject:(id)object {
    NSMutableArray *result = [NSMutableArray arrayWithArray:self.array];
    [result removeObject:object];
    self.array = result;
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    NSMutableArray *result = [NSMutableArray arrayWithArray:self.array];
    [result removeObjectAtIndex:index];
    self.array = result;
}

- (void)removeObjects:(NSArray *)objects {
    NSMutableArray *result = [NSMutableArray arrayWithArray:self.array];
    [result removeObjectsInArray:objects];
    self.array = result;
}

- (NSArray *)sortedArrayWithType:(AVArraySortType)sortType {
    switch (sortType) {
            AVSwitchCase(AVArraySortTypeAscending, { [self.array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                
                return ;
            }]; });
            AVSwitchCase(AVArraySortTypeDescending, {  });
            AVSwitchCaseDefault({});
    }
}

@end
