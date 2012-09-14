//
//  JoinUsScreen.h
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinUsScreen : UIViewController

@property (retain, nonatomic) IBOutlet UITextView *txtJoinus;

- (IBAction)clickToProceed:(id)sender;
- (IBAction)clickedToBack:(id)sender;
- (IBAction)clickedToGoHome:(id)sender;

@end
