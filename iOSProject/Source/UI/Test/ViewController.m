//
//  ViewController1.m
//  iOSProject
//
//  Created by Aleksandr Voropaev on 8/29/16.
//  Copyright © 2016 Aleksandr Voropaev. All rights reserved.
//

#import "ViewController.h"

#import "AVLabelView.h"

@interface ViewController ()
@property (nonatomic, readonly)   AVLabelView *labelView;

@end

@implementation ViewController

#pragma mark -
#pragma mark Acsessors

- (void)setData:(NSString *)data {
    if (_data != data) {
        _data = data;
    }
    
    self.labelView.label.text = data;
}

- (AVLabelView *)labelView {
    if ([self isViewLoaded] && [self.view isKindOfClass:[AVLabelView class]]) {
        return (AVLabelView *)self.view;
    }
    
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = self.data;
//    self.labelView.label.text = @"Yoo-hu-hoo!";
//    [[(AVLabelView *)[self view] label] setText:@"Youhu!"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Interface Handling

- (IBAction)onRotateButton:(id)sender {
    [self.labelView rotateView];
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
