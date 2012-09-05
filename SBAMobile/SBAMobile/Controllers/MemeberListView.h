//
//  MemeberListView.h
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemeberListView : UIViewController<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>






@property (nonatomic,retain) NSMutableArray *companyArray;
@property (nonatomic,retain) NSString *categoryTitle;
@property int categoryId;
-(id)initWithCategoryId:(int)catid andCategoryName:(NSString *)catstring;
- (IBAction)clickedToGoBack:(id)sender;
- (IBAction)clickedToGoHome:(id)sender;

@end
