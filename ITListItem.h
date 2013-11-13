//
//  ITListItem.h
//  InterviewTask
//
//  Created by AhmedElnaqah on 11/13/13.
//  Copyright (c) 2013 elnaqah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITListItem : NSObject
@property (strong) NSString * name;
@property (strong) NSURL * url;
- (id)initWithName:(NSString *) aname URL:(NSString *) aurl;
@end
