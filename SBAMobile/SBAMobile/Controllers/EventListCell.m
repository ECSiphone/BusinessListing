//
//  EventListCell.m
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "EventListCell.h"

@interface EventListCell ()

@end

@implementation EventListCell
@synthesize lblDate;
@synthesize lblEventName;
@synthesize delegate;

- (IBAction)clickedToAddIcal:(id)sender
{

    [delegate clickedToAdd];

}

- (IBAction)clickedToViewDetail:(id)sender
{

    [delegate ClickedToDetail:eveObject];

}

-(void)bindDataWithEventObject:(EventObject *)eve;
{
    
    eveObject=eve;
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM"];
     NSString *startdate=[formatter stringFromDate:eve.startDate];
    [self.lblDate setText:startdate];
    [self.lblEventName setText:eve.name];


}

@end
