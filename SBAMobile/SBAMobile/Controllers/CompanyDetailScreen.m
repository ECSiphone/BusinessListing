//
//  CompanyDetailScreen.m
//  SBAMobile
//
//  Created by vivek paliwal on 02/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "CompanyDetailScreen.h"
#import "DatabaseHelper.h"
#import "CompanyObject.h"

@interface CompanyDetailScreen ()

@end

@implementation CompanyDetailScreen
@synthesize lblCompanyNmae;
@synthesize txtCompnyDesc;
@synthesize lblServiceOfferd;
@synthesize lblDiscount;
@synthesize lblContact;
@synthesize capdesc;
@synthesize companyId;
@synthesize comObject;
@synthesize scrlView;

-(id)initWithCompanyId:(int)comid
{

    self=[self initWithNibName:@"CompanyDetailScreen" bundle:nil];
    self.companyId=comid;
    return self;


}

- (IBAction)clickedToGoBack:(id)sender {
    
    
     [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)clickedToGoHome:(id)sender {
    
     [self.navigationController popToRootViewControllerAnimated:YES];
}

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
    
    DatabaseHelper *helper=[[DatabaseHelper alloc]init];
    self.comObject=[helper comapnyDetailWithCompanyId:self.companyId];
    
    [self.scrlView setContentSize:CGSizeMake(320,700)];
    
    
     UIFont *regularfont=[UIFont fontWithName:@"candara" size:17.0f];
    
    [lblCompanyNmae setFont:regularfont];
    [lblContact setFont:regularfont];
    [lblDiscount setFont:regularfont];
    [lblServiceOfferd setFont:regularfont];
    
    
    [self.lblCompanyNmae setText:self.comObject.name];
    [self.txtCompnyDesc setText:self.comObject.description];
    [self.lblServiceOfferd setText:@""];
    [self.lblDiscount setText:@""];
    
    NSString *address=[NSString stringWithFormat:@"%@,\n%@,\n%@, %@, %@, %@\nPhone No:%@\nFax No:%@",self.comObject.add1,self.comObject.add2,self.comObject.city,self.comObject.state,self.comObject.country,self.comObject.zip,self.comObject.phoneno,self.comObject.fax];
    [self.lblContact setText:address];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLblCompanyNmae:nil];
    [self setTxtCompnyDesc:nil];
    [self setLblServiceOfferd:nil];
    [self setLblDiscount:nil];
    [self setLblContact:nil];
    [self setScrlView:nil];
    [self setCapdesc:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [lblCompanyNmae release];
    [txtCompnyDesc release];
    [lblServiceOfferd release];
    [lblDiscount release];
    [lblContact release];
    [scrlView release];
    [capdesc release];
    [super dealloc];
}
@end
