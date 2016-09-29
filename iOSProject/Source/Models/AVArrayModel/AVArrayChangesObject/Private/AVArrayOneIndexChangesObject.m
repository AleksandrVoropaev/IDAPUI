//
//  AVArrayChangesObject.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/26/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayOneIndexChangesObject.h"

#import "AVSwitchCaseMacro.h"

@interface AVArrayOneIndexChangesObject ()
@property (nonatomic, strong)   id              object;
@property (nonatomic, assign)   NSUInteger      index;

@end
@implementation AVArrayOneIndexChangesObject

+ (instancetype)arrayChangedWithObject:(id)object
                                 index:(NSUInteger)index
                           changesType:(AVArrayModelChange)changesType
{
    return [[self alloc] initWithObject:object
                                  index:index
                            changesType:changesType];
}

- (instancetype)initWithObject:(id)object
                         index:(NSUInteger)index
                   changesType:(AVArrayModelChange)changesType
{
    if (!object | !index | !changesType) {
        return nil;
    }
    
    self = [super initWithChangesType:changesType];
    self.object = object;
    self.index = index;
    
    return self;
}

- (void)applyToTableView:(UITableView *)tableView {
//    if (self.changesType == AVArrayModelChangeDidDeleteObject) {
//        [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathWithIndex:self.index]]
//                         withRowAnimation:UITableViewRowAnimationFade];
//    }
//    
//    if (self.changesType == AVArrayModelChangeDidInsertObject) {
//        [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathWithIndex:self.index]]
//                         withRowAnimation:UITableViewRowAnimationFade];
//    }
//    
    [tableView performSelector:[self selectorForState:self.changesType] withObject:tableView];
}

- (SEL)selectorForState:(AVArrayModelChange)modelChange {
    switch (modelChange) {
            AVSwitchCase(AVArrayModelChangeDidDeleteObject, { return @selector(applyDeletionToTableView:); });
            AVSwitchCase(AVArrayModelChangeDidInsertObject, { return @selector(applyInsertionToTableView:); });
            AVSwitchCaseDefault({ return nil; });
    }
}

- (void)applyInsertionToTableView:(UITableView *)tableView {
    [tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathWithIndex:self.index]]
                     withRowAnimation:UITableViewRowAnimationFade];
}

- (void)applyDeletionToTableView:(UITableView *)tableView {
    [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathWithIndex:self.index]]
                     withRowAnimation:UITableViewRowAnimationFade];
}

@end
