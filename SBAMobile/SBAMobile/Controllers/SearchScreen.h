//
//  SearchScreen.h
//  SBAMobile
//
//  Created by Vivek paliwal on 28/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchScreen : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>


@property (retain, nonatomic) IBOutlet UITextField *txtCompanyName;
@property (nonatomic,retain)NSMutableArray *catArray;

@property (retain, nonatomic) IBOutlet UIButton *dropDownButton;

- (IBAction)clickedToOpenPicker:(id)sender;

@property (retain, nonatomic) IBOutlet UIPickerView *catPicker;

- (IBAction)clickedToSearch:(id)sender;

- (IBAction)clickedToBack:(id)sender;



@end
