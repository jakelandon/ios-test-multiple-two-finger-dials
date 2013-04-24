//
//  RotatingDialsAppDelegate.h
//  RotatingDials
//
//  Created by jschwartz on 9/14/10.
//  Copyright 2010 BSSP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RotatingDialsViewController;

@interface RotatingDialsAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RotatingDialsViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RotatingDialsViewController *viewController;

@end

