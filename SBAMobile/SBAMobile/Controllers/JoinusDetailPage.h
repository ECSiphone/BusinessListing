//
//  JoinusDetailPage.h
//  SBAMobile
//
//  Created by Vivek paliwal on 09/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinusDetailPage : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{

    UIControl *activeControl;


}

- (IBAction)clickedToGoBack:(id)sender;

- (IBAction)clickedToGoHome:(id)sender;

- (IBAction)clickedToSubmitDetails:(id)sender;



@property (retain, nonatomic) IBOutlet UILabel *lblname;

@property (retain, nonatomic) IBOutlet UILabel *lbldesc;
@property (retain, nonatomic) IBOutlet UILabel *lblpersonname;
@property (retain, nonatomic) IBOutlet UILabel *lblmail;
@property (retain, nonatomic) IBOutlet UILabel *lblphoneno;

@property (retain, nonatomic) IBOutlet UITextField *txtCompanyName;

@property (retain, nonatomic) IBOutlet UITextView *txtCompanyDesc;

@property (retain, nonatomic) IBOutlet UITextField *personName;

@property (retain, nonatomic) IBOutlet UITextField *email;

@property (retain, nonatomic) IBOutlet UITextField *telno;

@property (retain, nonatomic) IBOutlet UITextView *txtComment;
@property (retain, nonatomic) IBOutlet UIScrollView *scrlView;

@end
