//
//  ProgrammingViewController.m
//  Oliver
//
//  Created by Oliver Johansson on 2018-01-18.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

#import "AboutMeViewController.h"
#import "NSObject+Global.h"

@interface AboutMeViewController ()

@end

@implementation AboutMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self getThemeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
