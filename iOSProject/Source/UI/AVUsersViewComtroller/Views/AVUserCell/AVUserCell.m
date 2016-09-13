//
//  AVUserCell.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUserCell.h"

#import "AVUser.h"
#import "AVImageView.h"

@implementation AVUserCell

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [super initWithCoder:aDecoder];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [super encodeWithCoder:aCoder];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self editingStyle];
}


#pragma mark -
#pragma mark Accessors

- (void)setUser:(AVUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(AVUser *)user {
    self.fullNameLabel.text = user.fullname;
    self.userImageView.imageModel = user.imageModel;
}

@end
