//
//  BCL6Swizzler.m
//  BCL6Demo
//
//  Created by George on 29/03/2009.
//  Copyright 2009 George Brocklehurst. All rights reserved.
//

#import <objc/objc-class.h>
#import "BCL6Swizzler.h"


@implementation BCL6Swizzler

/**
 * Uses the C code underlying Objective-C to rename a method
 * Pass selector names using the @selector(foo:bar:) syntax
 * Pass the class in using [MyClassName class]
 */
+ (BOOL)renameSelector:(SEL)oldSelector to:(SEL)newSelector onClass:(Class)class
{
	// Get the instance method
	Method method = class_getInstanceMethod(class, oldSelector);
	
	// Make sure the original method was valid
	if(method == nil)
		return FALSE;
	
	// Rename the method to the new selector name
	method->method_name = newSelector;
	
	return TRUE;
}

@end
