//
//  AVUserCell.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/6/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVTableViewCell.h"

@class AVUser;

@interface AVUserCell : AVTableViewCell
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;
@property (nonatomic, strong)   IBOutlet UIImageView    *userImageView;

@property (nonatomic, strong)   AVUser                  *user;

- (void)fillWithModel:(AVUser *)user;

@end
