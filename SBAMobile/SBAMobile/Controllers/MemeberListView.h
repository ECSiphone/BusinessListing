//
//  MemeberListView.h
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeberListView : UIViewController<UITableViewDelegate,UITableViewDataSource>







@property int categoryId;
-(id)initWithCategoryId:(int)catid;
- (IBAction)clickedToGoBack:(id)sender;

@end
