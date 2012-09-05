//
//  CategoryListView.h
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryListView : UIViewController<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{



}

@property (nonatomic,retain)NSMutableArray *categoryArray;
@property (retain, nonatomic) IBOutlet UITableView *tblCategory;

- (IBAction)clickedToGoBack:(id)sender;

- (IBAction)clickedToGoHome:(id)sender;


@end
