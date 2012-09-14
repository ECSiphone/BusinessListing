//
//  JoinusDetailPage.m
//  SBAMobile
//
//  Created by Vivek paliwal on 09/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "JoinusDetailPage.h"

@interface JoinusDetailPage ()

@end

@implementation JoinusDetailPage
@synthesize lblname;
@synthesize lbldesc;
@synthesize lblpersonname;
@synthesize lblmail;
@synthesize lblphoneno;
@synthesize txtCompanyName;
@synthesize txtCompanyDesc;
@synthesize personName;
@synthesize email;
@synthesize telno;
@synthesize txtComment;
@synthesize scrlView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if([text isEqualToString:@"\n"])
    {
        
        [textView resignFirstResponder];
        
    }
    return YES;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;


}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    activeControl=(UITextField *)textField;
    return YES;
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    activeControl= (UIControl *)textView;
    return YES;
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(showKeyboard) name:UIKeyboardDidShowNotification object:nil];
    [center addObserver:self selector:@selector(hideKeyboard) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)showKeyboard
{
    
    [self.scrlView scrollRectToVisible:CGRectMake(self.scrlView.frame.origin.x, activeControl.frame.origin.y, self.scrlView.frame.size.width, 300) animated:YES];
    
}

-(void)hideKeyboard
{
    
    [self.scrlView scrollRectToVisible:CGRectMake(self.scrlView.frame.origin.x,self.scrlView.frame.origin.y-88, self.scrlView.frame.size.width, 300) animated:YES];
        
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIFont *regularfont=[UIFont fontWithName:@"candara" size:17.0f];
    [lbldesc setFont:regularfont];
    [lblmail setFont:regularfont];
    [lblname setFont:regularfont];
    [lblpersonname setFont:regularfont];
    [lblphoneno setFont:regularfont];
    
    [self.scrlView setContentSize:CGSizeMake(320, 600)];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTxtCompanyName:nil];
    [self setTxtCompanyDesc:nil];
    [self setPersonName:nil];
    [self setEmail:nil];
    [self setTelno:nil];
    [self setTxtComment:nil];
    [self setScrlView:nil];
    [self setLblname:nil];
    [self setLbldesc:nil];
    [self setLblpersonname:nil];
    [self setLblmail:nil];
    [self setLblphoneno:nil];
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

- (IBAction)clickedToSubmitDetails:(id)sender {
}
- (void)dealloc {
    [txtCompanyName release];
    [txtCompanyDesc release];
    [personName release];
    [email release];
    [telno release];
    [txtComment release];
    [scrlView release];
    [lblname release];
    [lbldesc release];
    [lblpersonname release];
    [lblmail release];
    [lblphoneno release];
    [super dealloc];
}
@end
