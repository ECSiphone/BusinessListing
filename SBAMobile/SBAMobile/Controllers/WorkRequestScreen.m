//
//  WorkRequestScreen.m
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "WorkRequestScreen.h"
#import "DatabaseHelper.h"
#import "CategoryObject.h"


#define BUDGETSELECTED   @"BUDGETSELECTED"
#define CATEGORYSELECTED @"CATEGORYSELECTED"

@interface WorkRequestScreen ()

@end

@implementation WorkRequestScreen
@synthesize companyName;
@synthesize name;
@synthesize email;
@synthesize telNo;
@synthesize btnBudget;
@synthesize btnCategory;
@synthesize txtWorkDesc;
@synthesize scrlView;
@synthesize budgetArray;
@synthesize customePicker;
@synthesize categoryArray;
@synthesize lbldesc;
@synthesize lblbud;
@synthesize lblcat;
@synthesize lbldetail;
@synthesize lblname;
@synthesize lblemail;
@synthesize lblcomp;
@synthesize telephone;
@synthesize lblReq;
@synthesize selectedPicker;

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
    
    UIFont *regularfont=[UIFont fontWithName:@"candara" size:15.0f];
    
    [lblbud setFont:regularfont];
    [lbldesc setFont:regularfont];
    [lblcat setFont:regularfont];
    [lblcomp setFont:regularfont];
    [lbldetail setFont:regularfont];
    [lblemail setFont:regularfont];
    [lblname setFont:regularfont];
    //[lblReq setFont:regularfont];
    [telephone setFont:regularfont];
    
    self.categoryArray=[[NSMutableArray alloc]init];
    DatabaseHelper *helper=[[DatabaseHelper alloc]init];
    self.categoryArray=[helper readCategoryFromDatabase];
    
     self.budgetArray=[[NSMutableArray alloc]init];
     [self.budgetArray addObject:@"$0-$250"];
     [self.budgetArray addObject:@"$250-$500"];
     [self.budgetArray addObject:@"$500-$1000"];
     [self.budgetArray addObject:@"$1000-$2500"];
     [self.budgetArray addObject:@"$2500+"];
    
    
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

    [self.scrlView scrollRectToVisible:CGRectMake(self.scrlView.frame.origin.x,self.scrlView.frame.origin.y-81, self.scrlView.frame.size.width, 300) animated:YES];
    
}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    if([self.selectedPicker isEqualToString:BUDGETSELECTED])
    {
        return [self.budgetArray objectAtIndex:row];
    
    }
    
    else {
        
        CategoryObject *object=(CategoryObject *)[self.categoryArray objectAtIndex:row];
        return object.categoryName;
    }


}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if([self.selectedPicker isEqualToString:BUDGETSELECTED])
    {
        [self.btnBudget setTitle:[self.budgetArray objectAtIndex:row] forState:UIControlStateNormal];
        
    }
    
    else {
        
        CategoryObject *object=(CategoryObject *)[self.categoryArray objectAtIndex:row];
        [self.btnCategory setTitle:object.categoryName forState:UIControlStateNormal];
    }
  
    [self hidePicker];


}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    return 1;

}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if([self.selectedPicker isEqualToString:BUDGETSELECTED])
    {
        return [self.budgetArray count];
        
    }
    
    else {
        
        return [self.categoryArray count];
        }
}

- (void)viewDidUnload
{
    [self setTxtWorkDesc:nil];
    [self setCompanyName:nil];
    [self setName:nil];
    [self setEmail:nil];
    [self setTelNo:nil];
    [self setScrlView:nil];
    [self setCustomePicker:nil];
    [self setBtnBudget:nil];
    [self setBtnCategory:nil];
    [self setLbldesc:nil];
    [self setLblbud:nil];
    [self setLblcat:nil];
    [self setLbldetail:nil];
    [self setLblname:nil];
    [self setLblemail:nil];
    [self setLblcomp:nil];
    [self setTelephone:nil];
    [self setLblReq:nil];
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
    [customePicker release];
    [btnBudget release];
    [btnCategory release];
    [lbldesc release];
    [lblbud release];
    [lblcat release];
    [lbldetail release];
    [lblname release];
    [lblemail release];
    [lblcomp release];
    [telephone release];
    [lblReq release];
    [super dealloc];
}
- (IBAction)clickedToOpenBudget:(id)sender {
    
     self.selectedPicker=BUDGETSELECTED;
    [self showPicker];
   
    
    
}

- (IBAction)clikedToOpenMemberCategory:(id)sender {
    
    self.selectedPicker=CATEGORYSELECTED;
    [self showPicker];
    
}

- (IBAction)clickedToSubmit:(id)sender {
    
    
    if([self.txtWorkDesc.text isEqualToString:@""]||[[self.btnBudget titleForState:UIControlStateNormal]isEqualToString:@"Budget"]||[[self.btnCategory titleForState:UIControlStateNormal]isEqualToString:@"Category"]||[self.name.text isEqualToString:@""]||[self.companyName.text isEqualToString:@""]||[self.telNo.text isEqualToString:@""]||[self.email.text isEqualToString:@""])
    {
    
        UIAlertView *alertmis=[[UIAlertView alloc]initWithTitle:@"SBA" message:@"Some Field(s) Are Blank.Please Fill All Fields First." delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alertmis show];
        alertmis.tag=0;
        return;
    
    
    
    }
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"SBA" message:@"Your Request Has been Submitted" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [alert show];
    alert.tag=1;
        
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

    if(alertView.tag==1)
    {
         if(buttonIndex==0)
            {
               [self.navigationController popViewControllerAnimated:YES];
            }
    
    }
}
-(void)showPicker
{

    [UIView animateWithDuration:.1 animations:^{[self.customePicker setFrame:CGRectMake(0, 244, 320, 216)];}];
    [self.customePicker reloadComponent:0];

}


-(void)hidePicker
{

     [UIView animateWithDuration:.1 animations:^{[self.customePicker setFrame:CGRectMake(0, 460, 320, 216)];}];


}





- (IBAction)clickedToGoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)clickedToGoHome:(id)sender {
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}
@end
