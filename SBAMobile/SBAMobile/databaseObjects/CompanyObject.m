//
//  CompanyObject.m
//  SBAMobile
//
//  Created by Vivek paliwal on 31/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "CompanyObject.h"

@implementation CompanyObject
@synthesize catId,comId,name,add1,add2,zip,state,city,country,phoneno,fax,user,modDate;


-(id)initWithComid:(int)cmid catid:(int)caid name:(NSString *)n add1:(NSString *)addr1 add2:(NSString *)addr2 zip:(NSString *)z state:(NSString *)s city:(NSString *)c country:(NSString *)con phone:(NSString *)p faxNo:(NSString *)f user:(NSString *)u modDate:(NSDate *)mdat
{
    self.comId=cmid;
    self.catId=caid;
    self.name=n;
    self.add1=addr1;
    self.add2=addr2;
    self.zip=z;
    self.state=s;
    self.city=c;
    self.country=con;
    self.user=u;
    self.phoneno=p;
    self.fax=f;
    self.modDate=mdat;
    return self;
    
}






@end
