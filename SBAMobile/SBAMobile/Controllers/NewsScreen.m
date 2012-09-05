//
//  NewsScreen.m
//  SBAMobile
//
//  Created by Vivek paliwal on 04/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "NewsScreen.h"
#import "DatabaseHelper.h"
#import "NewsObject.h"

@interface NewsScreen ()

@end

@implementation NewsScreen
@synthesize scrollView;
@synthesize newsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    newsArray=[[NSMutableArray alloc]init];
    
    DatabaseHelper *helper=[[DatabaseHelper alloc]init];
    newsArray=[helper readNewsFromDatabase];
    
    
    
    for(int i=0;i<[newsArray count];i++)
    {
        NewsObject *newsObj=[newsArray objectAtIndex:i]; 
        UILabel *titleLable=[[UILabel alloc]initWithFrame:CGRectMake(scrollView.frame.size.width*i+20, 0, scrollView.frame.size.width-20, 50)];
        [titleLable setFont:[UIFont fontWithName:@"Helvetica-Bold" size:22.0]];
        [titleLable setTextColor:[UIColor colorWithRed:.1058 green:.2313 blue:.5607 alpha:1.0]];
        [titleLable setText:newsObj.newsHead];
        [titleLable setBackgroundColor:[UIColor clearColor]];
        [scrollView addSubview:titleLable];
        
        
        NSDateFormatter *forrmatter=[[NSDateFormatter alloc]init];
        [forrmatter setDateFormat:@"dd/MM/yyyy"];
        
        UILabel *newsDate=[[UILabel alloc]initWithFrame:CGRectMake(scrollView.frame.size.width*i+20, 50, scrollView.frame.size.width-20, 25)];
        [newsDate setText:[forrmatter stringFromDate:newsObj.newsDate]];
        [newsDate setTextColor:[UIColor colorWithRed:0.6235 green:0.6235 blue:0.6235 alpha:1.0]];
        [newsDate setBackgroundColor:[UIColor clearColor]];
        [scrollView addSubview:newsDate];

    
        UITextView *textview=[[UITextView alloc]initWithFrame:CGRectMake(scrollView.frame.size.width*i+15, 100, scrollView.frame.size.width-20, 200)];
        [textview setText:newsObj.content];
        [textview setEditable:NO];
        [textview setFont:[UIFont systemFontOfSize:18]];
        [textview setBackgroundColor:[UIColor clearColor]];
        [scrollView addSubview:textview];
        
     }
    
    [scrollView setContentSize:CGSizeMake(scrollView.frame.size.width*[newsArray count], 307)];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickedToGoBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)clickedToGoHome:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
- (void)dealloc {
    [scrollView release];
    [super dealloc];
}
@end
