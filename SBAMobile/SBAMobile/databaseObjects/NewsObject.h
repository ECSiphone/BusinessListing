//
//  NewsObject.h
//  SBAMobile
//
//  Created by Vivek paliwal on 01/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsObject : NSObject



@property int newsid;
@property (nonatomic,retain)NSString *newsHead;
@property (nonatomic,retain)NSString *content;
@property (nonatomic,retain)NSDate *newsDate;
@property (nonatomic,retain)NSString *user;
@property (nonatomic,retain)NSDate *moddate;


-(id)initWithid:(int)ids head:(NSString *)h cont:(NSString *)c date:(NSDate *)d user:(NSString *)u modDate:(NSDate *)mdat;


@end
