//
//  RotatingDialsViewController.m
//  RotatingDials
//
//  Created by jschwartz on 9/14/10.
//  Copyright 2010 BSSP. All rights reserved.
//

#import "RotatingDialsViewController.h"

@implementation RotatingDialsViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
	NSArray *dialSizes = [NSArray arrayWithObjects:@"550", @"500", @"450", @"400", @"350", @"300", @"250", nil];
	dials = [[NSMutableArray alloc] init];
	
	float switchX = 100;
	float switchY = 700;
	
	for(int i = 0; i < [dialSizes count]; i++)
	{
		
		DialView *d = [[DialView alloc] initWithFrame:CGRectZero];
		[d setDialSize:[[dialSizes objectAtIndex:i] intValue]];
		d.center = CGPointMake(768/2, 300);
		[dials addObject:d];
		[self.view addSubview:d];
		[d release];
		
		DialSwitchView *dsv = [[DialSwitchView alloc] initWithFrame:CGRectMake(switchX, switchY, 500, 25)];
		dsv.delegate = self;
		dsv.dialSize = [[dialSizes objectAtIndex:i] intValue];
		[self.view addSubview:dsv];
		[dsv release];
		
		switchY += 30;
		
	}
	
	
    [super viewDidLoad];
}

- (void)dialSwitchChanged:(DialSwitchView *)dsv
{
	for(int i = 0; i < [dials count]; i++)
	{
		DialView *d = [dials objectAtIndex:i];
		if(dsv.dialSize == d.dialSize)
		{
			d.hidden = !dsv.dialSwitch.on;
		}
	}
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
