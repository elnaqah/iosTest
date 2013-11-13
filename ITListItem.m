//
//  ITListItem.m
//  InterviewTask
//
//  Created by AhmedElnaqah on 11/13/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import "ITListItem.h"

@implementation ITListItem
- (id)initWithName:(NSString *) aname URL:(NSString *) aurl
{
    self = [super init];
    if (self) {
        self.name=aname;
        self.url=[NSURL URLWithString:aurl];
    }
    return self;
}
@end
