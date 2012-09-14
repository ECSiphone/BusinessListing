//
//  WorkRequestScreen.h
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkRequestScreen : UIViewController<UIAlertViewDelegate,UITextFieldDelegate,UITextViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{

    UIControl *activeControl;

}


@property (retain, nonatomic) IBOutlet UILabel *lbldesc;

@property (retain, nonatomic) IBOutlet UILabel *lblbud;

@property (retain, nonatomic) IBOutlet UILabel *lblcat;

@property (retain, nonatomic) IBOutlet UILabel *lbldetail;

@property (retain, nonatomic) IBOutlet UILabel *lblname;

@property (retain, nonatomic) IBOutlet UILabel *lblemail;

@property (retain, nonatomic) IBOutlet UILabel *lblcomp;

@property (retain, nonatomic) IBOutlet UILabel *telephone;
@property (retain, nonatomic) IBOutlet UILabel *lblReq;






@property (nonatomic,retain) NSString *selectedPicker;
@property (nonatomic,retain)NSMutableArray *categoryArray;
@property (nonatomic,retain) NSMutableArray *budgetArray;
@property (retain, nonatomic) IBOutlet UIPickerView *customePicker;


@property (retain, nonatomic) IBOutlet UITextView *txtWorkDesc;
@property (retain, nonatomic) IBOutlet UIScrollView *scrlView;

- (IBAction)clickedToOpenBudget:(id)sender;

- (IBAction)clikedToOpenMemberCategory:(id)sender;

- (IBAction)clickedToSubmit:(id)sender;

@property (retain, nonatomic) IBOutlet UITextField *companyName;

@property (retain, nonatomic) IBOutlet UITextField *name;
@property (retain, nonatomic) IBOutlet UITextField *email;

@property (retain, nonatomic) IBOutlet UITextField *telNo;

@property (retain, nonatomic) IBOutlet UIButton *btnBudget;
@property (retain, nonatomic) IBOutlet UIButton *btnCategory;
- (IBAction)clickedToGoBack:(id)sender;
- (IBAction)clickedToGoHome:(id)sender;

@end
