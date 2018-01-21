//
//  NSObject+Global.h
//  Oliver
//
//  Created by Oliver Johansson on 2018-01-15.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Global)
- (UIColor*)getThemeColor;
- (BOOL)getThemeState;
- (id)fetch:(NSString*)url;
@end
