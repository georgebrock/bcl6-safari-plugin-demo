//
//  BCL6BrowserWebView.m
//  BCL6Demo
//
//  Created by George on 29/03/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import "BCL6BrowserWebView.h"

@interface BrowserWebView (Swizzled)
- (void)_original_webView:(id)sender decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(id)frame decisionListener:(id)listener;
@end

@implementation BrowserWebView (BCL6)

- (void)_new_webView:(id)sender decidePolicyForNavigationAction:(NSDictionary *)actionInformation request:(NSURLRequest *)request frame:(id)frame decisionListener:(id)listener
{
	[self _original_webView:sender decidePolicyForNavigationAction:actionInformation request:request frame:frame decisionListener:listener];
}

@end
