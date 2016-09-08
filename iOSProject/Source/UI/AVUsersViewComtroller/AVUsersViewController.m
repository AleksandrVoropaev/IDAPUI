//
//  AVUsersViewController.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsersViewController.h"

#import "AVUser.h"
#import "AVUsersView.h"
#import "AVUserCell.h"

#import "UITableView+AVExtensions.h"
#import "UINib+AVExtensions.h"
#import "NSArray+AVExtensions.h"

@interface AVUsersViewController ()
@property (nonatomic, strong)   AVUsersView *usersView;
@property (nonatomic,assign)    NSUInteger  count;

@end

@implementation AVUsersViewController

@dynamic usersView;

#pragma mark -
#pragma mark Accsessors

- (AVUsersView *)usersView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[AVUsersView class]]) {
        return (AVUsersView *)self.view;
    }
    
    return nil;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.usersView.tableView reloadData];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class classAVUserCell = [AVUserCell class];
    AVUserCell *cell = (AVUserCell *)[tableView dequeueReusableCellWithClass:classAVUserCell];

    if (!cell) {
        UINib *nib = [UINib nibWithNibNameFromClassName:classAVUserCell];
        NSArray *cells = [nib instantiateWithOwner:nil options:nil];
        cell = [cells firstObjectWithClass:classAVUserCell];
    }
    
    cell.user = [AVUser new];
    
    return cell;
}

#pragma mark -
#pragma mark UITableViewDataSource


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
