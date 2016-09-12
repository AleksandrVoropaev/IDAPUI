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

#import "UITableView+AVExtensions.h"
#import "UINib+AVExtensions.h"
#import "NSArray+AVExtensions.h"

@interface AVUsersViewController ()
@property (nonatomic, strong)   AVUsersView *usersView;
@property (nonatomic, assign)   NSUInteger  count;
@property (nonatomic, assign)   BOOL        isAscending;

@end

@implementation AVUsersViewController

@dynamic usersView;

- (instancetype)init {
    self = [super init];
    self.users = [AVUsers new];
    
    return self;
}

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
    
    [self.users addUsersWithCount:10];
    
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

    AVUserCell *cell = [tableView dequeueReusableCellFromTableViewOrCreateNewFromNibWithClass:cellClass];
    cell.user = [self.users objectAtIndex:[indexPath indexAtPosition:1]];
    
    return cell;
}

- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
              withRowAnimation:(UITableViewRowAnimation)animation {
    for (NSIndexPath *indexPath in indexPaths) {
        [self.users removeObjectAtIndex:[indexPath indexAtPosition:1]];
    }
    
    [self.usersView.tableView reloadData];
}

#pragma mark -
#pragma mark Private

- (IBAction)onEditButton:(id)sender {
    BOOL editing = self.usersView.tableView.editing;
    
    [self.usersView.tableView setEditing:!editing animated:YES];
}

- (IBAction)onCreateButton:(id)sender {
    AVUser *user = [AVUser new];
    [self.users addObject:user];
    [self.usersView.tableView reloadData];
}

- (IBAction)onSortButton:(id)sender {
    [self.users removeAll];
    AVArraySortType sortType = AVArraySortTypeDescending;
    if (self.isAscending) {
        sortType = AVArraySortTypeAscending;
        self.isAscending = !self.isAscending;
    }
    
    [self.users addObjects:[self.users sortedArrayWithType:sortType]];
    [self.usersView.tableView reloadData];
}

@end
