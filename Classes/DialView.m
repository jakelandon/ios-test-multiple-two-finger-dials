//
//  DialView.m
//  RotatingDials
//
//  Created by jschwartz on 9/14/10.
//  Copyright 2010 BSSP. All rights reserved.
//

#import "DialView.h"


@implementation DialView


@synthesize dialSize;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		// set vars
		currentRotation = 0.0;
		currentVelocity = 0.0;
		
		// add bg img view
		bgImgView = [[UIImageView alloc] initWithFrame:frame];
		[self addSubview:bgImgView];
		[bgImgView release];
  
	
		// add rotation gesture recognizer
		rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self
																		  action:@selector(rotationHandler:)];
		[self addGestureRecognizer:rotationRecognizer];
		[rotationRecognizer release];
		
	}
    return self;
}

-(void)rotationHandler:(UIGestureRecognizer *)recognizer
{
	// get values from the gesture recognizer
	UIRotationGestureRecognizer *r = (UIRotationGestureRecognizer *)recognizer;
	UIGestureRecognizerState theState = r.state;
	CGFloat theRotation = r.rotation;
	CGFloat theVelocity = r.velocity;
	CGFloat newLockRotation = currentRotation + theRotation;
	
	switch (theState) {
		case UIGestureRecognizerStateBegan:
			// if timer is running, kill it
			if(rotateToStopTimer != nil)
			{
				[rotateToStopTimer invalidate];
				rotateToStopTimer = nil;
			}
			
			break;
			
		case UIGestureRecognizerStateChanged:
			
			// change rotation
			self.transform = CGAffineTransformMakeRotation(newLockRotation);
			
			break;
			
		case UIGestureRecognizerStateEnded:
			
			// set current values
			currentRotation = newLockRotation;
			
			// animate to stop
			rotateToStopTimer = [NSTimer scheduledTimerWithTimeInterval:kTimerInterval
																 target:self
															   selector:@selector(timerHandler:)
															   userInfo:nil
																repeats:YES];
			break;
			
		default:
			break;
	}
}

- (void)timerHandler:(NSTimer *)timer
{
	currentVelocity = currentVelocity * kLockFriction;
	CGFloat newRotationToAdd = currentVelocity / kTimerInterval;
	
	// adjust current rotation
	currentRotation += newRotationToAdd;
		
	// if currentVelocity is less than 0.1 stop timer
	if(currentVelocity <= 0.1 && currentVelocity >= -0.1)
	{
		currentVelocity = 0;
		[rotateToStopTimer invalidate];
		rotateToStopTimer = nil;
	}
	
	// set rotation of lock
	self.transform = CGAffineTransformMakeRotation(currentRotation);
}


- (int)dialSize { return dialSize; }
- (void)setDialSize:(int)value {
	dialSize = value;
	
	UIImage *bgImg = [UIImage imageNamed:[NSString stringWithFormat:@"dial_%ix%i.png", dialSize, dialSize]];
	bgImgView.image = bgImg;
	bgImgView.frame = CGRectMake(0,0,bgImg.size.width,bgImg.size.height);
	
	self.frame = bgImgView.frame;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc {
    [super dealloc];
}


@end
