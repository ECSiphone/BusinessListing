//
//  WorkRequestScreen.h
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkRequestScreen : UIViewController<UIAlertViewDelegate>

@property (retain, nonatomic) IBOutlet UITextView *txtWorkDesc;
@property (retain, nonatomic) IBOutlet UIScrollView *scrlView;

- (IBAction)clickedToOpenBudget:(id)sender;

- (IBAction)clikedToOpenMemberCategory:(id)sender;

- (IBAction)clickedToSubmit:(id)sender;

@property (retain, nonatomic) IBOutlet UITextField *companyName;

@property (retain, nonatomic) IBOutlet UITextField *name;
@property (retain, nonatomic) IBOutlet UITextField *email;

@property (retain, nonatomic) IBOutlet UITextField *telNo;


@end
