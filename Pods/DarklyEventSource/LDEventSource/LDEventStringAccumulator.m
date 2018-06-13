//
//  LDEventStringAccumulator.m
//  DarklyEventSource
//
//  Created by Mark Pokorny on 5/30/18. +JMJ
//  Copyright © 2018 Catamorphic Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDEventStringAccumulator.h"
#import "LDEventParser.h"

@implementation LDEventStringAccumulator
-(void)accumulateEventStringWithString:(NSString*)eventString {
    if (eventString.length == 0) { return; }
    if (self.eventString == nil) {
        self.eventString = eventString;
        return;
    }
    self.eventString = [self.eventString stringByAppendingString:eventString];
}

-(BOOL)isReadyToParseEvent {
    if (self.eventString.length == 0) { return NO; }
    return [self.eventString containsString:kLDEventSourceEventTerminator];
}

-(void)reset {
    self.eventString = nil;
}
@end
