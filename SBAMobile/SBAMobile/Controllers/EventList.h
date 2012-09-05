//
//  EventList.h
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventListCell.h"

@interface EventList : UIViewController<UITableViewDataSource,UITableViewDelegate,EventListCellDelegate>



@property (nonatomic,retain)NSMutableArray *eventArray;
@property (retain, nonatomic) IBOutlet UITableView *tblEvent;
@property (retain, nonatomic) IBOutlet EventListCell *eventCell;

- (IBAction)clickedToGoBack:(id)sender;

- (IBAction)clickedToGoHome:(id)sender;

@end
