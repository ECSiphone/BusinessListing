//
//  CategoryObject.h
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryObject : NSObject



@property int catId;
@property (nonatomic,retain) NSString *categoryName;
@property (nonatomic,retain) NSString *userName;
@property (nonatomic,retain) NSDate *modDate;


-(id)initWithId:(int)ids catName:(NSString *)name userName:(NSString *)user andDate:(NSDate *)date;


@end
