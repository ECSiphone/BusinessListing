//
//  NewsObject.m
//  SBAMobile
//
//  Created by Vivek paliwal on 01/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "NewsObject.h"

@implementation NewsObject
@synthesize newsid,newsDate,newsHead,content,user,moddate;


-(id)initWithid:(int)ids head:(NSString *)h cont:(NSString *)c date:(NSDate *)d user:(NSString *)u modDate:(NSDate *)mdat
{

    self.newsid=ids;
    self.newsHead=h;
    self.content=c;
    self.newsDate=d;
    self.user=u;
    self.moddate=mdat;
    return self;

}

@end
