//
//  SearchListView.h
//  SBAMobile
//
//  Created by Vivek paliwal on 28/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchListView : UIViewController<UITableViewDataSource,UITableViewDelegate>




@property (nonatomic,retain)NSString *keyWord;
@property int categoryId;
@property (retain, nonatomic) IBOutlet UITableView *resultTbl;
@property (nonatomic,retain)NSMutableArray *companyObjectArray;
- (IBAction)clickToBack:(id)sender;
-(id)initWithCategoryIndex:(int)catid andKeyWord:(NSString *)key;

@end
