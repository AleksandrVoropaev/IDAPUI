//
//  AVArrayChangesObject+AVArrayModel.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 10/4/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVArrayChangesObject.h"

#import "AVArrayModel.h"

@interface AVArrayChangesObject (AVArrayModel)

// Need to overwrite in subclasses. Don't call it directly
- (void)applyToModel:(AVArrayModel *)model;

@end
