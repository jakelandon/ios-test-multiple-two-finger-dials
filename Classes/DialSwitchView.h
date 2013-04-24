//
//  DialSwitchView.h
//  RotatingDials
//
//  Created by jschwartz on 9/14/10.
//  Copyright 2010 BSSP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DialSwitchView;

@protocol DialSwitchViewDelegate

- (void)dialSwitchChanged:(DialSwitchView *)dsv;

@end


@interface DialSwitchView : UIView {
	id <DialSwitchViewDelegate> delegate;
	int dialSize;
	UISwitch *dialSwitch;
	UILabel *dialLabel;	
}

@property (nonatomic, assign) id <DialSwitchViewDelegate> delegate;
@property (nonatomic, assign) int dialSize;
@property (nonatomic, retain) UISwitch *dialSwitch;

- (int)dialSize;
- (void)setDialSize:(int)value;

@end
