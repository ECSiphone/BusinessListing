//
//  WorkRequestScreen.m
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "WorkRequestScreen.h"

@interface WorkRequestScreen ()

@end

@implementation WorkRequestScreen
@synthesize companyName;
@synthesize name;
@synthesize email;
@synthesize telNo;
@synthesize txtWorkDesc;
@synthesize scrlView;
@synthesize budgetArray;

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
    [self.scrlView setContentSize:CGSizeMake(320, 600)];
    // Do any additional setup after loading the view from its nib.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;


}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *to=[touches anyObject];
    if(to.phase==UITouchPhaseBegan)
    {
    
        [self resignKeyBoard];
    
    }
   

}


-(void)resignKeyBoard
{
    [self.name resignFirstResponder];
    [self.email resignFirstResponder];
    [self.telNo resignFirstResponder];
    [self.txtWorkDesc resignFirstResponder];
    [self.companyName resignFirstResponder];

}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{

    if([text isEqualToString:@"\n"])
    {
    
        [textView resignFirstResponder];
    
    }
    return YES;

}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{

    activeControl=(UITextField *)textField;
    return YES;

}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    activeControl= (UITextView *)textView;
    return YES;


}


-(void)viewWillAppear:(BOOL)animated{

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(showKeyboard) name:UIKeyboardDidShowNotification object:nil];
    [center addObserver:self selector:@selector(hideKeyboard) name:UIKeyboardWillHideNotification object:nil];

}

-(void)showKeyboard
{

   // [self.scrlView scrollRectToVisible:CGRectMake(self.scrlView.frame.origin.x, self.scrlView.frame.origin.y, self.scrlView.frame.size.width, 120) animated:YES];
    
    [self.scrlView scrollRectToVisible:CGRectMake(self.scrlView.frame.origin.x, activeControl.frame.origin.y, self.scrlView.frame.size.width, 200) animated:YES];

}

-(void)hideKeyboard
{

    [self.scrlView scrollRectToVisible:CGRectZero animated:YES];
    
//    CGRect rect=CGRectMake(self.scrlView.frame.origin.x, self.scrlView.frame.origin.y, self.scrlView.contentSize.width,  self.scrlView.frame.size.height);
//    
//    [self.scrlView scrollRectToVisible:rect animated:YES];


}





- (void)viewDidUnload
{
    [self setTxtWorkDesc:nil];
    [self setCompanyName:nil];
    [self setName:nil];
    [self setEmail:nil];
    [self setTelNo:nil];
    [self setScrlView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [txtWorkDesc release];
    [companyName release];
    [name release];
    [email release];
    [telNo release];
    [scrlView release];
    [super dealloc];
}
- (IBAction)clickedToOpenBudget:(id)sender {
}

- (IBAction)clikedToOpenMemberCategory:(id)sender {
}

- (IBAction)clickedToSubmit:(id)sender {
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"SBA" message:@"Your Request Has been Submitted" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
        
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

   if(buttonIndex==0)
   {
   
       [self.navigationController popViewControllerAnimated:YES];
   
   }


}


@end
