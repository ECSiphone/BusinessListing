//
//  SearchListView.h
//  SBAMobile
//
//  Created by Vivek paliwal on 28/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchListView : UIViewController<UITableViewDataSource,UITableViewDelegate>


@property (retain, nonatomic) IBOutlet UITableView *resultTbl;

@property (nonatomic,retain)NSMutableArray *companyNameArray;
@property (nonatomic,retain)NSMutableArray *descArray;
- (IBAction)clickToBack:(id)sender;

@end
