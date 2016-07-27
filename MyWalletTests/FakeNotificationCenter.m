//
//  FakeNotificationCenter.m
//  MyWallet
//
//  Created by Verónica Cordobés on 25/7/16.
//  Copyright © 2016 Verónica Cordobés. All rights reserved.
//

#import "FakeNotificationCenter.h"

@implementation FakeNotificationCenter

-(id) init{
    if(self = [super init]){
        _observers = [NSMutableDictionary dictionary];
    }
    
    return self;
}

-(void) addObserver:(id) observer
           selector:(nonnull SEL)aSelector
               name:(nullable NSString *)aName
             object:(nullable id)anObject{
    
    [self.observers setObject:observer forKey:aName];
}

@end
