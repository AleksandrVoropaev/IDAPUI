//
//  AVTableViewCell.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVTableViewCell.h"

@implementation AVTableViewCell

#pragma mark -
#pragma mark Initializations and Deallocations



#pragma mark -
#pragma mark Accessors

- (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

@end
