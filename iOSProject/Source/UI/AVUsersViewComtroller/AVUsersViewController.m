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
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = [AVUserCell class];

    AVUserCell *cell = [tableView dequeueReusableCellFromTableViewOrCreateNewFromNibWithClass:cellClass];
    cell.user = [AVUser new];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark -
#pragma mark Private

- (IBAction)onEditButton:(id)sender {
    BOOL editing = self.usersView.tableView.editing;
    if (editing) {
        editing = NO;
    } else {
        editing = YES;
    }
    
    [self.usersView.tableView setEditing:editing animated:YES];
}

- (IBAction)onCreateButton:(id)sender {

}


@end
