//
//  EventObject.h
//  SBAMobile
//
//  Created by vivek paliwal on 02/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventObject : NSObject



@property int eventId;
@property (nonatomic,retain)NSString *name;
@property (nonatomic,retain)NSString *desc;
@property (nonatomic,retain)NSString *loc;
@property (nonatomic,retain)NSString *price;
@property (nonatomic,retain)NSString *user;
@property (nonatomic,retain)NSDate *startDate;
@property (nonatomic,retain)NSDate *endDate;
@property (nonatomic,retain)NSDate *modDate;
@property (nonatomic,retain)NSString *otherinfo;
@property (nonatomic,retain)NSString *nonMemberPrice;

-(id)initWithId:(int)ids name:(NSString *)n desc:(NSString *)d startDate:(NSDate *)sd endDate:(NSDate *)ed loc:(NSString *)l price:(NSString *)p user:(NSString *)u modDate:(NSDate *)mod otherinfo:(NSString *)o nonMemberPrice:(NSString *)nbp;

@end
