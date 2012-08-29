//
//  EventListCell.h
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol EventListCellDelegate

-(void)clickedToAdd;
-(void)ClickedToDetail;

@end;


@interface EventListCell : UITableViewCell
{




}

@property (assign)  id<EventListCellDelegate>  delegate;
@property (retain, nonatomic) IBOutlet UILabel *lblDate;

@property (retain, nonatomic) IBOutlet UILabel *lblEventName;

- (IBAction)clickedToAddIcal:(id)sender;

- (IBAction)clickedToViewDetail:(id)sender;


@end
