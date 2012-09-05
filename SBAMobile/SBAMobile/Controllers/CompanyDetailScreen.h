//
//  CompanyDetailScreen.h
//  SBAMobile
//
//  Created by vivek paliwal on 02/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyObject.h"

@interface CompanyDetailScreen : UIViewController





@property int companyId;
@property (nonatomic,retain) CompanyObject *comObject;
@property (retain, nonatomic) IBOutlet UIScrollView *scrlView;

-(id)initWithCompanyId:(int)comid;
- (IBAction)clickedToGoBack:(id)sender;
- (IBAction)clickedToGoHome:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *lblCompanyNmae;
@property (retain, nonatomic) IBOutlet UITextView *txtCompnyDesc;
@property (retain, nonatomic) IBOutlet UILabel *lblServiceOfferd;
@property (retain, nonatomic) IBOutlet UILabel *lblDiscount;
@property (retain, nonatomic) IBOutlet UILabel *lblContact;

@end
