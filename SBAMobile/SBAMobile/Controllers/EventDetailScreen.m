//
//  EventDetailScreen.m
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "EventDetailScreen.h"

@interface EventDetailScreen ()

@end

@implementation EventDetailScreen
@synthesize lblEventName;
@synthesize lblVanueNmae;
@synthesize lblDate;
@synthesize lblPrice;
@synthesize lblOtherInfo;
@synthesize eventId;

-(id)initWithEventId:(int)ids
{
    self=[self initWithNibName:@"EventDetailScreen" bundle:nil];
    self.eventId=ids;
    return self;

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
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setLblEventName:nil];
    [self setLblVanueNmae:nil];
    [self setLblDate:nil];
    [self setLblPrice:nil];
    [self setLblOtherInfo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [lblEventName release];
    [lblVanueNmae release];
    [lblDate release];
    [lblPrice release];
    [lblOtherInfo release];
    [super dealloc];
}
- (IBAction)clickedToRegister:(id)sender {
}

- (IBAction)clickedToBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
