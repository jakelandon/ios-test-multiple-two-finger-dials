//
//  DialView.h
//  RotatingDials
//
//  Created by jschwartz on 9/14/10.
//  Copyright 2010 BSSP. All rights reserved.
//

#import <UIKit/UIKit.h>

// lock definitions
#define kTimerInterval 1.0/60.0
#define kLockFriction 0.85

@interface DialView : UIView {
	UIImageView *bgImgView;
	UIRotationGestureRecognizer *rotationRecognizer;
	CGFloat currentRotation;
	CGFloat currentVelocity;
	NSTimer *rotateToStopTimer;
	int dialSize;
	
}

@property (nonatomic, assign) int dialSize;

- (int)dialSize;
- (void)setDialSize:(int)value;

@end
