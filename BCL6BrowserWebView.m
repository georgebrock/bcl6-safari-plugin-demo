//
//  BCL6BrowserWebView.m
//  BCL6Demo
//
//  Created by George on 29/03/2009.
//  Copyright 2009 George Brocklehurst.
//  Creative Commons, see the accompanying LICENSE file for details.
//

#import "BCL6BrowserWebView.h"

/**
 * This interface defines methods that are created by swizzling
 * The method implementations are created at run time, these headers are only included to prevent compiler errors
 */
@interface BrowserWebView (Swizzled)
- (void)bcl6_original_webView:(id)sender decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(id)frame decisionListener:(id)listener;
@end

/**
 * Add the BCL6 category to the BrowserWebView
 * This defines new method implementations that we will use to replace existing methods via swizzling
 */
@implementation BrowserWebView (BCL6)

/**
 * This will be swizzled to become the webView:decidePolicyForNavigationAction:request:frame:decisionListener: WebView delegate method
 * For more information on that method see http://tinyurl.com/cddz2k
 * The bcl6 prefix prevents clashes with other plugins potentially doing swizzling on the same method
 */
- (void)bcl6_new_webView:(id)sender decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(id)frame decisionListener:(id)listener
{
	// Log the action information (view this output in Console.app)
	NSLog(@"%@", actionInformation);
	
	// Check that this policy decision was triggered by a link click
	if([[actionInformation valueForKey:@"WebActionNavigationTypeKey"] intValue] == 0) // WebNavigationTypeLinkClicked
	{
		// Display an annoying and pointless confirmation
		NSAlert *confirm = [NSAlert alertWithMessageText:@"Are you really, really sure?" 
										   defaultButton:@"Yes"
										 alternateButton:@"No"
											 otherButton:nil
							   informativeTextWithFormat:@""];
		
		// If the user clicked "no" return
		if([confirm runModal] == NSAlertAlternateReturn)
			return;
	}
	
	// Call the original implementation of this method
	[self bcl6_original_webView:sender decidePolicyForNavigationAction:actionInformation request:request frame:frame decisionListener:listener];
}

@end
