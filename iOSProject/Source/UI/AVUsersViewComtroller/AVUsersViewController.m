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

#import "UITableView+AVExtensions.h"
#import "UINib+AVExtensions.h"
#import "NSArray+AVExtensions.h"

#import "AVRootViewMacro.h"
#import "AVSwitchCaseMacro.h"

AVRootViewPrivateInterfaceWithDynamicProperty(AVUsersViewController, AVUsersView, usersView);

@interface AVUsersViewController ()
@property (nonatomic, strong)   AVUsersSortingArrayModel    *tableData;

@end

@implementation AVUsersViewController

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self initialize];
    
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self initialize];

    return self;
}

- (void)initialize {
    AVUsers *users = [AVUsers new];
    self.users = users;
}

#pragma mark -
#pragma mark Accsessors

- (void)setUsers:(AVUsers *)users {
    if (_users != users) {
//        [_users removeObserver:self.tableData];
        _users = users;
//        [_users addObserver:self.tableData];
        self.tableData = [AVUsersSortingArrayModel sortingArrayModelWithModel:users];
    }
}

- (void)setTableData:(AVUsersSortingArrayModel *)tableData {
    if (_tableData != tableData) {
        [_tableData removeObserver:self];
        _tableData = tableData;
        [_tableData addObserver:self];
        
        [self.usersView.tableView reloadData];
    }
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
        [self.tableData removeObjectAtIndex:indexPath.row];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.tableData moveObjectFromIndex:[sourceIndexPath indexAtPosition:1]
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
    [self.tableData addObject:user];
}

- (IBAction)onSortButton:(id)sender {
    [self.usersView.tableView setEditing:NO animated:YES];
    
    [self resortUsers];
}

- (void)resortUsers {
    AVArraySortType sortType = self.tableData.sortType;
    sortType = (sortType + 1) % AVArraySortTypeCount;
    self.tableData.sortType = sortType;
    
    BOOL sorting = YES;
    if (sortType == AVArraySortTypeNotSorted) {
        sorting = NO;
    }
    
    self.usersView.sorting = sorting;
}

#pragma mark -
#pragma mark Array Observation

- (void)arrayModel:(AVArrayModel *)arrayModel didChangeWithChangesObject:(AVArrayChangesObject *)changes {
    [changes applyToTableView:self.usersView.tableView];
    [changes applyToModel:self.tableData.users];
}

@end
