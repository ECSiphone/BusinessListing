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
@synthesize eventObject;

-(id)initWithEvent:(EventObject *)eve
{
    self=[self initWithNibName:@"EventDetailScreen" bundle:nil];
    self.eventObject=eve;
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
    [self.lblEventName setText:eventObject.name];
    [self.lblPrice setText:[NSString stringWithFormat:@"Price:%@",eventObject.price]];
    [self.lblVanueNmae setText:[NSString stringWithFormat:@"Location:%@",eventObject.loc]];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
     if(eventObject.startDate==eventObject.endDate)
         [self.lblDate setText:[formatter stringFromDate:eventObject.startDate]];
     else {
         [self.lblDate setText:[NSString stringWithFormat:@"%@ - %@",[formatter stringFromDate:eventObject.startDate],[formatter stringFromDate:eventObject.endDate]]];
     }
     
    [self.lblOtherInfo setText:eventObject.otherinfo];
    
    
    
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

- (IBAction)clickedToGoHome:(id)sender {
}
@end
