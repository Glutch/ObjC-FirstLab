//
//  GameViewController.m
//  Oliver
//
//  Created by Oliver Johansson on 2018-01-15.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

#import "GameViewController.h"
#import "NSObject+Global.h"

@interface GameViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UILabel *triesLabel;
@property (nonatomic) int currentValue;
@property (nonatomic) int tries;
@property (nonatomic) int won;
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self getThemeColor];
    [self restart];
}

- (void)restart {
    self.currentValue = arc4random_uniform(10);
    self.won = 0;
    self.tries = 0;
}

- (IBAction)sliderEvt:(id)sender {
    if (self.won) {
        [self restart];
    }
    NSLog(@"%f", self.slider.value);
    self.tries++;
    self.triesLabel.text = [NSString stringWithFormat:@"Tries: %d ", self.tries];
    int sliderVal = (int)self.slider.value;
    int guessVal = self.currentValue;
    if (sliderVal == guessVal) {
        self.status.text = @"Correct!";
        self.won = 1;
    } else if (sliderVal > guessVal) {
        self.status.text = @"Lower";
    } else if (sliderVal < guessVal) {
        self.status.text = @"Higher";
    }
}

- (IBAction)sliderValueChanged:(id)sender {
    self.number.text = [NSString stringWithFormat:@"%d", (int)self.slider.value];
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
