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

AVRootViewPrivateInterfaceWithDynamicProperty(AVUsersViewController, AVUsersView, usersView);

@interface AVUsersViewController ()
@property (nonatomic, assign)   NSUInteger              count;
@property (nonatomic, strong)   AVSortingArrayModel     *sortedUsers;
@property (nonatomic, strong)   AVUsers                 *notSortedUsers;
@property (nonatomic, assign)   NSUInteger              iterator;

@end

@implementation AVUsersViewController

#pragma mark -
#pragma mark Class Methods

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.users = [AVUsers new];
    self.notSortedUsers = self.users;
    self.sortedUsers = [AVSortingArrayModel sortArray:self.users];

    return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.users = [AVUsers new];
    self.sortedUsers = [AVSortingArrayModel sortArray:self.users];

    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    self.users = [AVUsers new];
    self.sortedUsers = [AVSortingArrayModel sortArray:self.users];
    
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
    cell.user = [self.users objectAtIndex:[indexPath indexAtPosition:1]];
    
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
    [self.users addObject:[AVUser new]];
//    [self.notSortedUsers addObject:[AVUser new]];
    [self.usersView.tableView reloadData];
}

- (IBAction)onSortButton:(id)sender {
    if ([self needToSort]) {
        self.users = [self.sortedUsers resortedUsers];
    } else {
        self.users = self.notSortedUsers;
    }
}

- (BOOL)needToSort {
    _iterator = (_iterator + 1) % 3;
    if (_iterator > 2) {
        _iterator = 0;
    }
    
    return _iterator == 0 ? NO : YES;
}

#pragma mark -
#pragma mark Private

@end
