//
//  BCL6Demo.m
//  BCL6Demo
//
//  Created by George on 29/03/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import "BCL6Demo.h"
#import "BCL6Swizzler.h"
#import "BCL6BrowserWebView.h"


@implementation BCL6Demo

/**
 * This method will be triggered when the InputManager bundle is loaded.
 * The load method on this class will be called because it is the bundle's principle class (see the NSPrincipleClass setting in Info.plist)
 */
+(void)load
{
	// Get the main bundle
	// This will be the host application bundle
	NSBundle *hostApp = [NSBundle mainBundle];
	
	// Check the host application is Safari by checking its bundle identifier
	NSString *bundleID = [hostApp bundleIdentifier];
	if(![bundleID isEqualToString:@"com.apple.Safari"])
		return;
	
	// Check this version of Safari is supported
	// This code checks for the latest version and only the latest version (at time of writing)
	NSDictionary *infoDict = [hostApp infoDictionary];
	float v = [[infoDict valueForKey:@"CFBundleVersion"] floatValue];
	if(v - 5528.16 > 0.009 || v - 5528.16 < -0.009) // Work around silly rounding errors
	{
		//TODO: Tell the user why the plugin hasn't loaded (this version of Safari isn't supported)
		//      Better to fail gracefully for unsupported versions than to cause a massive crash
		return;
	}	
	
	// Display the Hello World dialog
	// A more useful thing to do here would be to insert your own UI elements into the Safari GUI
	NSAlert *greeting = [NSAlert alertWithMessageText:@"Hello World" 
										defaultButton:nil 
									  alternateButton:nil
										  otherButton:nil
							informativeTextWithFormat:@"This message is brought to you by Barcamp London"];
	
	[greeting runModal];
	
	// Swizzle browser web view methods
	// This replaces a standard Safari method with a custom method defined in this bundle
	[BCL6Swizzler renameSelector:@selector(webView:decidePolicyForNavigationAction:request:frame:decisionListener:) to:@selector(bcl6_original_webView:decidePolicyForNavigationAction:request:frame:decisionListener:) onClass:[BrowserWebView class]];
	[BCL6Swizzler renameSelector:@selector(bcl6_new_webView:decidePolicyForNavigationAction:request:frame:decisionListener:) to:@selector(webView:decidePolicyForNavigationAction:request:frame:decisionListener:) onClass:[BrowserWebView class]];
}

@end
