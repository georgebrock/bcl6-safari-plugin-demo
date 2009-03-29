//
//  BCL6Demo.m
//  BCL6Demo
//
//  Created by George on 29/03/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import "BCL6Demo.h"


@implementation BCL6Demo

+(void)load
{
	NSBundle *hostApp = [NSBundle mainBundle];
	
	// Check the host app is Safari
	NSString *bundleID = [hostApp bundleIdentifier];
	if(![bundleID isEqualToString:@"com.apple.Safari"])
		return;
	
	// Check this version of Safari is supported
	NSDictionary *infoDict = [hostApp infoDictionary];
	float v = [[infoDict valueForKey:@"CFBundleVersion"] floatValue];
	if(v != 5528.16)
	{
		//TODO: Tell the user why the plugin hasn't loaded (this version of Safari isn't supported)
		return;
	}	
	
	NSLog(@"Hello world");
}

@end
