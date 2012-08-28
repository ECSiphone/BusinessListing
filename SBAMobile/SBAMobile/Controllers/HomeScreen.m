//
//  HomeScreen.m
//  SBAMobile
//
//  Created by Vivek paliwal on 28/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "HomeScreen.h"
#import "SearchScreen.h"
#import "WorkRequestScreen.h"

@interface HomeScreen ()

@end

@implementation HomeScreen

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
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)clickedToOpenSearch:(id)sender {
    
    SearchScreen *screen=[[SearchScreen alloc]initWithNibName:@"SearchScreen" bundle:nil];
    [self.navigationController pushViewController:screen animated:YES];
    
    
}

- (IBAction)clickToOpenMemberPage:(id)sender {
}

- (IBAction)clickedToGoWorkRequest:(id)sender {
    
    WorkRequestScreen *request=[[WorkRequestScreen alloc]initWithNibName:@"WorkRequestScreen" bundle:nil];
    [self.navigationController pushViewController:request animated:YES];
    
}

- (IBAction)clickedToEvent:(id)sender {
}

- (IBAction)clickedToNews:(id)sender {
}

- (IBAction)clickedToJoin:(id)sender {
}
@end
