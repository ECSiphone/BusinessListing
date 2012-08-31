//
//  SearchScreen.m
//  SBAMobile
//
//  Created by Vivek paliwal on 28/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "SearchScreen.h"
#import "SearchListView.h"
#import "DatabaseHelper.h"
#import "CategoryObject.h"

@interface SearchScreen ()

@end

@implementation SearchScreen
@synthesize catPicker;
@synthesize txtCompanyName;
@synthesize catArray;
@synthesize dropDownButton;

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
    self.catArray=[[NSMutableArray alloc]init];
    DatabaseHelper *helper=[[[DatabaseHelper alloc]init]autorelease];
    
    self.catArray=[helper readCategoryFromDatabase];
    
    
    // Do any additional setup after loading the view from its nib.
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

 return 1;

}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return [self.catArray count];

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
     
    CategoryObject *catObj=(CategoryObject *)[self.catArray objectAtIndex:row];
    return catObj.categoryName;
    
    
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{

    CategoryObject *catObj=(CategoryObject *)[self.catArray objectAtIndex:row];
    [self.dropDownButton setTitle:catObj.categoryName forState:UIControlStateNormal];
    [self HidePicker];

}




- (void)viewDidUnload
{
    [self setTxtCompanyName:nil];
    [self setCatPicker:nil];
    [self setDropDownButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [txtCompanyName release];
    [catPicker release];
    [dropDownButton release];
    [super dealloc];
}
- (IBAction)clickedToOpenPicker:(id)sender {
    
    
    [UIView animateWithDuration:.5 animations:^{[self.catPicker setFrame:CGRectMake(0, 244, 320, 216) ];}]; 
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    
    if(touch.phase==UITouchPhaseBegan)
    {
        [self.txtCompanyName resignFirstResponder];  
    
    }
    
}

-(void)HidePicker
{


[UIView animateWithDuration:.5 animations:^{[self.catPicker setFrame:CGRectMake(0, 460, 320, 216) ];}]; 


}



- (IBAction)clickedToSearch:(id)sender {
    
    SearchListView *list=[[SearchListView alloc]initWithNibName:@"SearchListView" bundle:nil];
    [self.navigationController pushViewController:list animated:YES];
    
}

- (IBAction)clickedToBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
