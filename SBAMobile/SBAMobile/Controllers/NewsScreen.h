//
//  NewsScreen.h
//  SBAMobile
//
//  Created by Vivek paliwal on 04/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsScreen : UIViewController











@property (nonatomic,retain)NSMutableArray *newsArray;
- (IBAction)clickedToGoBack:(id)sender;

- (IBAction)clickedToGoHome:(id)sender;


@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;



@end
