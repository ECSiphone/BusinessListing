//
//  CategoryObject.m
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "CategoryObject.h"

@implementation CategoryObject



@synthesize catId;
@synthesize categoryName;
@synthesize userName;
@synthesize modDate;




-(id)initWithId:(int)ids catName:(NSString *)name userName:(NSString *)user andDate:(NSDate *)date{

    self.catId=ids;
    self.categoryName=name;
    self.userName=user;
    self.modDate=date;
    return self;
}

@end
