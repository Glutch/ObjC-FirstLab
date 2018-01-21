//
//  NSObject+Global.m
//  Oliver
//
//  Created by Oliver Johansson on 2018-01-15.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

#import "NSObject+Global.h"
#import <UIKit/UIKit.h>

@implementation NSObject (Global)
- (UIColor*)getThemeColor {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger themeState = [defaults integerForKey:@"theme"];
    
    if (themeState == 1) {
        return [UIColor whiteColor];
    } else {
        return [UIColor lightGrayColor];
    }
}

- (BOOL)getThemeState {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger themeState = [defaults integerForKey:@"theme"];
    
    if (themeState == 1) {
        return YES;
    } else {
        return NO;
    }
}

- (id)fetch:(NSString*)url {
    NSError *error;
    NSString *url_string = [NSString stringWithFormat:@"%@", url];
    NSData *data = [NSData dataWithContentsOfURL: [NSURL URLWithString:url_string]];
    id json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    //NSLog(@"json: %@", json);
    return json;
}
@end
