//
//  AVFacebookLoginViewController.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 11/3/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "AVFacebookLoginViewController.h"

#import "AVFacebookLoginContext.h"

@interface AVFacebookLoginViewController ()

@end

@implementation AVFacebookLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginButton:(id)sender {
    AVFacebookLoginContext *loginContext = [AVFacebookLoginContext new];
    loginContext.viewController = self;
    [loginContext execute];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
