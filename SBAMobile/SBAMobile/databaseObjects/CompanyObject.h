//
//  CompanyObject.h
//  SBAMobile
//
//  Created by Vivek paliwal on 31/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyObject : NSObject






@property int comId;
@property int catId;
@property (nonatomic,retain)NSString *name;
@property (nonatomic,retain)NSString *add1;
@property (nonatomic,retain)NSString *add2;
@property (nonatomic,retain)NSString *zip;
@property (nonatomic,retain)NSString *state;
@property (nonatomic,retain)NSString *city;
@property (nonatomic,retain)NSString *country;
@property (nonatomic,retain)NSString *phoneno;
@property (nonatomic,retain)NSString *fax;
@property (nonatomic,retain)NSString *user;
@property (nonatomic,retain)NSDate *modDate;
@property (nonatomic,retain)NSString *description;
@property (nonatomic,retain)NSString *discount;




-(id)initWithComid:(int)cmid catid:(int)caid name:(NSString *)n add1:(NSString *)add1 add2:(NSString *)add2 zip:(NSString *)z state:(NSString *)s city:(NSString *)c country:(NSString *)con phone:(NSString *)p faxNo:(NSString *)f user:(NSString *)u modDate:(NSDate *)mdat anddesc:(NSString *)d discount:(NSString *)disc;


@end
