//
//  RotatingDialsViewController.h
//  RotatingDials
//
//  Created by jschwartz on 9/14/10.
//  Copyright 2010 BSSP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DialView.h"
#import "DialSwitchView.h"

@interface RotatingDialsViewController : UIViewController <DialSwitchViewDelegate> {
	
	NSMutableArray *dials;
}

@end

