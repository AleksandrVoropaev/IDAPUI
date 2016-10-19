//
//  AVUsersViewController.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 9/2/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVUsersViewController.h"

#import "AVUser.h"
#import "AVUsers.h"
#import "AVUsersView.h"
#import "AVUserCell.h"
#import "AVUsersSortingArrayModel.h"
#import "AVArrayChangesObject.h"
#import "AVArrayOneIndexChangesObject.h"
#import "AVArrayTwoIndexesChangesObject.h"
#import "AVArrayChangesObject+UITableView.h"
#import "AVArrayChangesObject+AVArrayModel.h"
#import "AVGCD.h"
#import "AVLoadingView.h"

#import "UITableView+AVExtensions.h"
#import "UINib+AVExtensions.h"
#import "NSArray+AVExtensions.h"

#import "AVRootViewMacro.h"
#import "AVSwitchCaseMacro.h"

AVRootViewPrivateInterfaceWithDynamicProperty(AVUsersViewController, AVUsersView, usersView);

@interface AVUsersViewController ()
@property (nonatomic, strong)   AVUsersSortingArrayModel    *tableData;
//@property (nonatomic, strong)   AVLoadingView               *loadingView;

@end

@implementation AVUsersViewController

#pragma mark -
#pragma mark Accsessors

- (void)setUsers:(AVUsers *)users {
    if (_users != users) {
        _users = users;
        if ([self isViewLoaded]) {
            [_users load];
        }
        
        self.tableData = [AVUsersSortingArrayModel sortingArrayModelWithModel:users];
    }
}

- (void)setTableData:(AVUsersSortingArrayModel *)tableData {
    if (_tableData != tableData) {
//        [tableData.model load];
        [_tableData removeObserver:self];
        _tableData = tableData;
        [_tableData addObserver:self];
//        [_tableData.model load];
//        [self.usersView.tableView reloadData];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.loadingView = [AVLoadingView loadingViewForView:self.usersView];
//    [self.loadingView becomeVisible];

    [self.usersView showLoadingView];
    [self.usersView.tableView reloadData];
    [self.usersView hideLoadingView];
    // Do any additional setup after loading the view from its nib.
}

//- (void)viewDidAppear:(BOOL)animated {
////    [self.loadingView becomeInvisible];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = [AVUserCell class];

    AVUserCell *cell = [tableView dequeueReusableCellWithClass:cellClass];
    cell.user = self.tableData[indexPath.row];
    
    return cell;
}

- (void)        tableView:(UITableView *)tableView
       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeObjectAtIndex:indexPath.row];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectFromIndex:[sourceIndexPath indexAtPosition:1]
                            toIndex:[destinationIndexPath indexAtPosition:1]];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark -
#pragma mark Buttons Processing

- (IBAction)onEditButton:(id)sender {
    BOOL editing = self.usersView.tableView.editing;
    [self.usersView.tableView setEditing:!editing animated:YES];
}

- (IBAction)onCreateButton:(id)sender {
    AVUser *user = [AVUser new];
    [self.users addObject:user];
}

- (IBAction)onSortButton:(id)sender {
    [self.usersView.tableView setEditing:NO animated:YES];
    
    [self resortUsers];
}

- (void)resortUsers {
    AVArraySortType sortType = self.tableData.sortType;
    sortType = (sortType + 1) % AVArraySortTypeCount;
    self.tableData.sortType = sortType;
    
    BOOL sorting = !(sortType == AVArraySortTypeNotSorted);
    
    self.usersView.sorting = sorting;
}

#pragma mark -
#pragma mark Array Observation

- (void)arrayModel:(AVArrayModel *)arrayModel didChangeWithChangesObject:(AVArrayChangesObject *)changes {
    AVDispatchSyncBlockOnMainQueue(^{
        [changes applyToTableView:self.usersView.tableView];
    });
}

@end
