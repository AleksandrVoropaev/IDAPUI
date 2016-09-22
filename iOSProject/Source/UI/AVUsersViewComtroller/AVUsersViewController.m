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
@property (nonatomic, strong)   AVSortingArrayModel     *sortedUsers;
@property (nonatomic, strong)   AVUsers                 *notSortedUsers;
@property (nonatomic, assign)   NSUInteger              iterator;
@property (nonatomic, assign)   AVUsersSortType         sortType;

@end

@implementation AVUsersViewController

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    AVUsers *users = [AVUsers new];
    self.notSortedUsers = [AVUsers new];
    [self.notSortedUsers replaceAllObjectsWithObjects:users.objects];
    self.users = users;
    self.sortedUsers = [AVSortingArrayModel sortArray:self.users.objects];

    return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    AVUsers *users = [AVUsers new];
    self.notSortedUsers = [AVUsers new];
    [self.notSortedUsers replaceAllObjectsWithObjects:users.objects];
    self.users = users;
    self.sortedUsers = [AVSortingArrayModel sortArray:self.users.objects];

    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    AVUsers *users = [AVUsers new];
    self.notSortedUsers = [AVUsers new];
    [self.notSortedUsers replaceAllObjectsWithObjects:users.objects];
    self.users = users;
    self.sortedUsers = [AVSortingArrayModel sortArray:self.users.objects];
    
    return self;
}

#pragma mark -
#pragma mark Accsessors

-(void)setUsers:(AVUsers *)users {
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
    return self.users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Class cellClass = [AVUserCell class];

    AVUserCell *cell = [tableView dequeueReusableCellWithClass:cellClass];
    cell.user = self.users[indexPath.row];
    
    return cell;
}

- (void)        tableView:(UITableView *)tableView
       commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.users removeObjectAtIndex:indexPath.row];
//        [self.notSortedUsers removeObjectAtIndex:indexPath.row];
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
//    [self.notSortedUsers moveObjectFromIndex:[sourceIndexPath indexAtPosition:1]
//                                     toIndex:[destinationIndexPath indexAtPosition:1]];
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
    [self.sortedUsers addObject:user];
    [self.notSortedUsers addObject:user];
    [self.usersView.tableView reloadData];
}

- (IBAction)onSortButton:(id)sender {
    self.sortType = (self.sortType + 1) % AVUsersSortTypeCount;
    switch (self.sortType) {
        AVSwitchCase(AVUsersSortTypeAscending, { [self resortUsers]; });
        AVSwitchCase(AVUsersSortTypeDescending, { [self resortUsers]; });
        AVSwitchCase(AVUsersSortTypeNotSorted, {
            [self.users replaceAllObjectsWithObjects:self.notSortedUsers.objects];
            [self.usersView.tableView reloadData];
        });
        AVSwitchCaseDefault({});
    }
//    if ([self needToSort]) {
//        [self.sortedUsers resortArray];
//        [self.users replaceAllObjectsWithObjects:self.sortedUsers.objects];
//        [self.usersView.tableView reloadData];
//    } else {
////        self.users = self.notSortedUsers;
//        [self.users replaceAllObjectsWithObjects:self.notSortedUsers.objects];
//        [self.usersView.tableView reloadData];
//    }
}

- (void)resortUsers {
    [self.sortedUsers resortArray];
    [self.users replaceAllObjectsWithObjects:self.sortedUsers.objects];
    [self.usersView.tableView reloadData];
}


//- (BOOL)needToSort {
//    _iterator = (_iterator + 1) % 3;
//    return _iterator != 0;
//}

#pragma mark -
#pragma mark Private

@end
