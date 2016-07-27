//
//  NSObject+GNUStepAddons.m
//  MyWallet
//
//  Created by Verónica Cordobés on 20/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObject+GNUStepAddons.h"

@implementation NSObject (GNUStepAddons)

-(id) subclassResponsibility:(SEL)aSel{
    char prefix = class_isMetaClass(object_getClass(self)) ? '+': '-';
    [NSException raise: NSInvalidArgumentException
                format:@"%@%c%@ should be overriden by its subclass",
     ([self class]),
     prefix,
     NSStringFromSelector(aSel)];
    return self;
}

@end
