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

+ (BOOL)renameSelector:(SEL)oldSelector to:(SEL)newSelector onClass:(Class)class
{
	Method method = class_getInstanceMethod(class, oldSelector);
	if(method == nil)
		return FALSE;
	
	method->method_name = newSelector;
	return TRUE;
}

@end
