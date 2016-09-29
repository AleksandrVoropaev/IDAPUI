//
//  AVArrayTwoIndexesChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayTwoIndexesChangesObject.h"

@interface AVArrayTwoIndexesChangesObject ()
@property (nonatomic, assign)   NSUInteger  targetIndex;

@end

@implementation AVArrayTwoIndexesChangesObject

+ (instancetype)arrayChangedWithObject:(id)object
                                 index:(NSUInteger)index
                           targetIndex:(NSUInteger)targetIndex
                           changesType:(AVArrayModelChange)changesType
{
    return [[self alloc] initWithObject:object index:index targetIndex:targetIndex changesType:changesType];
}

- (instancetype)initWithObject:(id)object
                         index:(NSUInteger)index
                   targetIndex:(NSUInteger)targetIndex
                   changesType:(AVArrayModelChange)changesType
{
    if (!targetIndex) {
        return nil;
    }

    self = [super initWithObject:object index:index changesType:changesType];
    self.targetIndex = targetIndex;
    
    return self;
}

- (void)applyToTableView:(UITableView *)tableView {
    if (self.changesType == AVArrayModelChangeDidMoveObject) {
        [tableView moveRowAtIndexPath:[NSIndexPath indexPathWithIndex:self.index]
                          toIndexPath:[NSIndexPath indexPathWithIndex:self.targetIndex]];
    }
}

@end
