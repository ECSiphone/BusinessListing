//
//  EventDetailScreen.h
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventObject.h"

@interface EventDetailScreen : UIViewController




-(id)initWithEvent:(EventObject *)eve;

@property (retain, nonatomic) IBOutlet UILabel *lblcaploc;
@property (retain, nonatomic) IBOutlet UILabel *lblcapvalue;
@property (retain, nonatomic) IBOutlet UILabel *lblcapmemberprice;
@property (retain, nonatomic) IBOutlet UILabel *lblcapnonmemberprice;

@property (nonatomic,retain)EventObject *eventObject;
@property (retain, nonatomic) IBOutlet UILabel *lblEventName;

@property (retain, nonatomic) IBOutlet UILabel *lblVanueNmae;
@property (retain, nonatomic) IBOutlet UILabel *nonmemberprice;

@property (retain, nonatomic) IBOutlet UILabel *lblDate;
@property (retain, nonatomic) IBOutlet UILabel *lblPrice;
@property (retain, nonatomic) IBOutlet UILabel *lblpricenonmember;

@property (retain, nonatomic) IBOutlet UILabel *lblOtherInfo;

- (IBAction)clickedToRegister:(id)sender;

- (IBAction)clickedToBack:(id)sender;

- (IBAction)clickedToGoHome:(id)sender;

@end
