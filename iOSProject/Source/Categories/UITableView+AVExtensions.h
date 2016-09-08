//
//  UITableView+AVExtensions.h
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/8/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (AVExtensions)

- (UITableView *)dequeueReusableCellWithClass:(Class)cls;

@end
