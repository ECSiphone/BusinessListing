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
    // Do any additional setup after loading the view from its nib.
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
