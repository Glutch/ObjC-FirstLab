//
//  ViewController.m
//  Oliver
//
//  Created by Oliver Johansson on 2018-01-15.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+Global.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *themeSwitchBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self getThemeColor];
    if ([self getThemeState]) {
        [self.themeSwitchBtn setOn:YES];
    } else {
        [self.themeSwitchBtn setOn:NO];
    }
}

- (IBAction)themeSwitch:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (_themeSwitchBtn.on) {
        [defaults setInteger:1 forKey:@"theme"];
    } else {
        [defaults setInteger:0 forKey:@"theme"];
    }
    
    [defaults synchronize];
    
    self.view.backgroundColor = [self getThemeColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
