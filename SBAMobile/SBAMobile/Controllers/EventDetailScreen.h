//
//  EventDetailScreen.h
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventDetailScreen : UIViewController


@property int eventId;

-(id)initWithEventId:(int)ids;


@property (retain, nonatomic) IBOutlet UILabel *lblEventName;

@property (retain, nonatomic) IBOutlet UILabel *lblVanueNmae;

@property (retain, nonatomic) IBOutlet UILabel *lblDate;
@property (retain, nonatomic) IBOutlet UILabel *lblPrice;

@property (retain, nonatomic) IBOutlet UILabel *lblOtherInfo;

- (IBAction)clickedToRegister:(id)sender;

- (IBAction)clickedToBack:(id)sender;


@end
