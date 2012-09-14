//
//  JoinUsScreen.m
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "JoinUsScreen.h"
#import "JoinusDetailPage.h"


@interface JoinUsScreen ()

@end

@implementation JoinUsScreen
@synthesize txtJoinus;

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
    UIFont *regularfont=[UIFont fontWithName:@"candara" size:17.0f];
    [txtJoinus setFont:regularfont];
    
    [self.txtJoinus setText:@"The SBA aims to improve the quality of life and economic vitality of the Schaumburg Area. We connect our members to each other and to the community and serve as the primary advocate for businesses in the region.\n\nThe Schaumburg Business Association exists because of businesses and individuals including you. Our mission is connecting people and supporting businesses. We’re dedicated to connecting our members – to work together, play together, and grow together as a community.\n\nIf you’re a SBA member, I sincerely thank you for your involvement and encourage you to be in touch about the evolving ways the SBA can help you meet your business objectives. If you’re not a member yet, I invite you to join the hundreds of businesses listed on this site by calling us today at (847) 413-1010."];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTxtJoinus:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickToProceed:(id)sender {
    
    JoinusDetailPage *page=[[JoinusDetailPage alloc]initWithNibName:@"JoinusDetailPage" bundle:nil];
    [self.navigationController pushViewController:page animated:YES];
    
    
    
}

- (IBAction)clickedToBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (IBAction)clickedToGoHome:(id)sender {
    
     [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)dealloc {
    [txtJoinus release];
    [super dealloc];
}
@end
