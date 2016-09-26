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
#import "AVArrayModel.h"
#import "AVSortingArrayModel.h"
#import "AVArrayChangesObject.h"

#import "UITableView+AVExtensions.h"
#import "UINib+AVExtensions.h"
#import "NSArray+AVExtensions.h"

#import "AVRootViewMacro.h"
#import "AVSwitchCaseMacro.h"

AVRootViewPrivateInterfaceWithDynamicProperty(AVUsersViewController, AVUsersView, usersView);

typedef enum : NSUInteger {
    AVUsersSortTypeAscending,
    AVUsersSortTypeDescending,
    AVUsersSortTypeNotSorted,
    AVUsersSortTypeCount,
} AVUsersSortType;

@interface AVUsersViewController ()
@property (nonatomic, strong)   AVSortingArrayModel     *tableData;
@property (nonatomic, assign)   AVUsersSortType         sortType;

@end

@implementation AVUsersViewController

//@dynamic tableData;

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    self.sortType = AVUsersSortTypeNotSorted;
    self.users = [AVUsers new];
    self.tableData = [AVSortingArrayModel sortingArrayModel:self.users];
    [self.tableData replaceAllObjectsWithObjects:self.users.objects];
    [self.tableData addObserver:self];

    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];

    self.sortType = AVUsersSortTypeNotSorted;
    self.users = [AVUsers new];
    self.tableData = [AVSortingArrayModel sortingArrayModel:self.users];
//    self.tableData = [AVSortingArrayModel new];
    [self.tableData replaceAllObjectsWithObjects:self.users.objects];
    [self.tableData addObserver:self];

    return self;
}

#pragma mark -
#pragma mark Accsessors

- (void)setUsers:(AVUsers *)users {
    if (_users != users) {
        _users = users;
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
        [self.users removeObjectAtIndex:indexPath.row];
        [self.tableData removeObjectAtIndex:indexPath.row];
        [self.usersView.tableView deleteRowsAtIndexPaths:@[indexPath]
                                        withRowAnimation:YES];
    }
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectFromIndex:[sourceIndexPath indexAtPosition:1]
                            toIndex:[destinationIndexPath indexAtPosition:1]];
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
    [self.users addObject:user];
    [self.tableData addObject:user];
    [self.usersView.tableView reloadData];
}

- (IBAction)onSortButton:(id)sender {
    [self.usersView.tableView setEditing:NO animated:YES];
    
    AVUsersSortType sortType = (self.sortType + 1) % AVUsersSortTypeCount;
    self.sortType = sortType;
    AVUsersView *usersView = self.usersView;
    
    switch (sortType) {
        case AVUsersSortTypeAscending:
        AVSwitchCase(AVUsersSortTypeDescending, {
//            [usersView changeButtonsVisibilityWithType:AVButtonsHiddenTypeSortVisible];
            usersView.sorting = YES;
            [self resortUsers];
        });
        AVSwitchCase(AVUsersSortTypeNotSorted, {
            [self.tableData replaceAllObjectsWithObjects:self.users.objects];
//            [usersView changeButtonsVisibilityWithType:AVButtonsHiddenTypeAllVisible];
            usersView.sorting = NO;
            [usersView.tableView reloadData];
        });
        AVSwitchCaseDefault({});
    }
}

- (void)resortUsers {
    self.tableData.sortType = (self.tableData.sortType + 1) % AVArraySortTypeCount;
    [self.usersView.tableView reloadData];
}

#pragma mark -
#pragma mark Array Observation

- (void)arrayModel:(AVArrayModel *)arrayModel didDeleteObjectAtIndex:(AVArrayChangesObject *)changes  {
    NSArray *indexArray = @[changes.baseIndex];
    [self.usersView.tableView deleteRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
}

- (void)arrayModel:(AVArrayModel *)arrayModel didCreateObjectAtIndex:(AVArrayChangesObject *)changes {
    [self arrayModel:arrayModel didInsertObjectAtIndex:changes];
}

- (void)arrayModel:(AVArrayModel *)arrayModel didInsertObjectAtIndex:(AVArrayChangesObject *)changes  {
    NSArray *indexArray = @[changes.baseIndex];
    [self.usersView.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
}


@end
