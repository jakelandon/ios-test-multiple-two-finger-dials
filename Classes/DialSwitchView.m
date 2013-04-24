//
//  DialSwitchView.m
//  RotatingDials
//
//  Created by jschwartz on 9/14/10.
//  Copyright 2010 BSSP. All rights reserved.
//

#import "DialSwitchView.h"


@implementation DialSwitchView

@synthesize delegate;
@synthesize dialSize;
@synthesize dialSwitch;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {

        dialLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,300,25)];
		dialLabel.backgroundColor = [UIColor clearColor];
		[self addSubview:dialLabel];
		[dialLabel release];
		
		dialSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(120, 0, 60, 25)];
		[dialSwitch setOn:YES];
		[dialSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
		[self addSubview:dialSwitch];
		[dialSwitch release];
		
		// Initialization code
    }
    return self;
}

- (void)switchChanged:(id)sender 
{
	[[self delegate] dialSwitchChanged:self];
}

- (int)dialSize { return dialSize; }
- (void)setDialSize:(int)value {
	dialSize = value;
	
	dialLabel.text = [NSString stringWithFormat:@"Dial: %ix%i", dialSize, dialSize];
	
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc 
{
	delegate = nil;
    [super dealloc];
}


@end
