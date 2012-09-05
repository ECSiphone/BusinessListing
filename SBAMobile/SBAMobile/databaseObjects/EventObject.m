//
//  EventObject.m
//  SBAMobile
//
//  Created by vivek paliwal on 02/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "EventObject.h"

@implementation EventObject
@synthesize name,desc,startDate,endDate,modDate,price,user,loc,eventId,otherinfo;


-(id)initWithId:(int)ids name:(NSString *)n desc:(NSString *)d startDate:(NSDate *)sd endDate:(NSDate *)ed loc:(NSString *)l price:(NSString *)p user:(NSString *)u modDate:(NSDate *)mod otherinfo:(NSString *)o
{
    self.eventId=ids;
    self.name=n;
    self.desc=d;
    self.startDate=sd;
    self.endDate=ed;
    self.loc=l;
    self.price=p;
    self.user=u;
    self.modDate=mod;
    self.otherinfo=o;
    return self;

}






@end
