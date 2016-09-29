//
//  AVArrayTwoIndexesChangesObject.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/27/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AVArrayOneIndexChangesObject.h"
#import "AVArrayModel.h"

@interface AVArrayTwoIndexesChangesObject : AVArrayOneIndexChangesObject
@property (nonatomic, readonly)   NSUInteger    targetIndex;

+ (instancetype)arrayChangedWithObject:(id)object
                                 index:(NSUInteger)index
                           targetIndex:(NSUInteger)targetIndex
                             arraySate:(AVArrayModelChange)arraySate;

- (void)applyToTableView:(UITableView *)tableView;

@end
