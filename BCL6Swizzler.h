//
//  BCL6Swizzler.h
//  BCL6Demo
//
//  Created by George on 29/03/2009.
//  Copyright 2009 George Brocklehurst.
//  Creative Commons, see the accompanying LICENSE file for details.
//

#import <Cocoa/Cocoa.h>


@interface BCL6Swizzler : NSObject {

}

+ (BOOL)renameSelector:(SEL)oldSelector to:(SEL)newSelector onClass:(Class)class;

@end
