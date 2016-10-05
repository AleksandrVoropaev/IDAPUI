//
//  AVSortingArrayModel.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/15/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVSortingArrayModel.h"

#import "AVArrayModel.h"

#import "AVSwitchCaseMacro.h"

@interface AVSortingArrayModel ()
@property (nonatomic, strong)   AVArrayModel  *model;

@end

@implementation AVSortingArrayModel

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sortingArrayModelWithModel:(AVArrayModel *)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.model = nil;
}

- (instancetype)init {
    return [self initWithModel:nil];
}

- (instancetype)initWithModel:(AVArrayModel *)model {
    if (!model) {
        return nil;
    }
    
    self = [super init];
    self.model = model;

    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(AVArrayModel *)model {
    @synchronized (self) {
        if (_model != model) {
            [_model removeObserver:self];
            _model = model;
            [_model addObserver:self];
            if (_model) {
                [self addObjects:model.objects];
                [self sort];
            }
        }
    }
}

- (void)setSortType:(AVArraySortType)sortType {
    @synchronized (self) {
        if (_sortType != sortType) {
            _sortType = sortType;
            if (self.objects) {
                [self sort];
            }
        }
    }
}

#pragma mark -
#pragma mark Public

- (void)sortWithType:(AVArraySortType)sortType {
    @synchronized (self) {
        id result = self.model.objects;
        if (sortType != AVArraySortTypeNotSorted) {
            result = [result sortedArrayUsingDescriptors:[self sortDescriptorsWithSortType:sortType]];
        }
        
        [self replaceAllObjectsWithObjects:result];
    }
}

- (NSArray<NSSortDescriptor *> *)sortDescriptorsWithSortType:(AVArraySortType)sortType {
    return nil; // need to overrite in subclasses
}

#pragma mark -
#pragma mark Private

- (void)sort {
    [self sortWithType:self.sortType];
}

@end
