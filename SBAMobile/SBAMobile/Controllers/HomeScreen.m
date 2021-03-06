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
#import "CategoryListView.h"
#import "EventList.h"
#import "JoinUsScreen.h"
#import "NewsScreen.h"


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
    
    CategoryListView *list=[[CategoryListView alloc]initWithNibName:@"CategoryListView" bundle:nil];
    [self.navigationController pushViewController:list animated:YES];
    
    
}

- (IBAction)clickedToGoWorkRequest:(id)sender {
    
    WorkRequestScreen *request=[[WorkRequestScreen alloc]initWithNibName:@"WorkRequestScreen" bundle:nil];
    [self.navigationController pushViewController:request animated:YES];
    
}

- (IBAction)clickedToEvent:(id)sender {
    
    EventList *list=[[EventList alloc]initWithNibName:@"EventList" bundle:nil];
    [self.navigationController pushViewController:list animated:YES];
    
}

- (IBAction)clickedToNews:(id)sender {
    
    NewsScreen *screen=[[NewsScreen alloc]initWithNibName:@"NewsScreen" bundle:nil];
    [self.navigationController pushViewController:screen animated:YES];

    
    
}

- (IBAction)clickedToJoin:(id)sender {
    
    JoinUsScreen *scr=[[JoinUsScreen alloc]initWithNibName:@"JoinUsScreen" bundle:nil];
    [self.navigationController pushViewController:scr animated:YES];
    
}
@end
