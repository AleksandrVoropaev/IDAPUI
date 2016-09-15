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
//@property (nonatomic, strong)   AVUsersView     *usersView;
@property (nonatomic, assign)   NSUInteger      count;

@end

@implementation AVUsersViewController

//@dynamic usersView;

#pragma mark -
#pragma mark Class Methods

//+ (instancetype)usersViewControllerWithModel:(AVUsers *)model {
//    return [[self alloc] initWithModel:model];
//}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.users = [AVUsers new];
    
    return self;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self.users = [AVUsers new];

    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    self.users = [AVUsers new];
    
    return self;
}

#pragma mark -
#pragma mark Accsessors

//- (AVUsersView *)usersView {
//    if ([self isViewLoaded] && [self.view isKindOfClass:[AVUsersView class]]) {
//        return (AVUsersView *)self.view;
//    }
//    
//    return nil;
//}

-(void)setUsers:(AVUsers *)users {
    if (_users != users) {
        _users = nil;
        _users = [AVUsers new];
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
        [self.usersView.tableView deleteRowsAtIndexPaths:@[indexPath]
                                        withRowAnimation:YES];
    }
    
//    [self.usersView.tableView reloadData];
}

- (void)    tableView:(UITableView *)tableView
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
          toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [self.users moveObjectFromIndex:[sourceIndexPath indexAtPosition:1]
                            toIndex:[destinationIndexPath indexAtPosition:1]];
//    [self.usersView.tableView reloadData];
}

- (BOOL)        tableView:(UITableView *)tableView
    canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    [self.usersView.tableView reloadData];
}

- (IBAction)onSortButton:(id)sender {
    
    AVUsers *sortedUsers = [AVSortingArrayModel sortedArray:self.users];
    self.users = sortedUsers;
    [self.usersView.tableView reloadData];
}

#pragma mark -
#pragma mark Private

//- (void)setModel:(AVUsers *)model {
//    self.users = model;
//}
//
@end
