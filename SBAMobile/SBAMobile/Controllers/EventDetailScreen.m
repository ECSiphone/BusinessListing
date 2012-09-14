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
@synthesize nonmemberprice;
@synthesize lblDate;
@synthesize lblPrice;
@synthesize lblpricenonmember;
@synthesize lblOtherInfo;
@synthesize lblcaploc;
@synthesize lblcapvalue;
@synthesize lblcapmemberprice;
@synthesize lblcapnonmemberprice;
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
    
    
    UIFont *regularfont=[UIFont fontWithName:@"candara" size:17.0f];
    
//    UIFont *regularfont=[UIFont fontWithName:@"candara" size:20.0f];
    
   // [lblcaploc setFont:regularfont];
   // [lblcapmemberprice setFont:regularfont];
   // [lblcapnonmemberprice setFont:regularfont];
    [lblDate setFont:regularfont];
    //[lblEventName setFont:regularfont];
    [lblOtherInfo setFont:regularfont];
    [lblPrice setFont:regularfont];
    [lblpricenonmember setFont:regularfont];
    [lblVanueNmae setFont:regularfont];
    
    
    [self.lblEventName setText:eventObject.name];
    
    
    NSString *price;
    if([eventObject.price isEqualToString:@""])
        price=@"--";
    else {
        price=[NSString stringWithFormat:@"$%@",eventObject.price];
    }
    
    [self.lblPrice setText:price];
    
    NSString *nonMemberPrice;
    
    if([eventObject.nonMemberPrice isEqualToString:@""])
        nonMemberPrice=@"--";
    else {
        nonMemberPrice=[NSString stringWithFormat:@"$%@",eventObject.nonMemberPrice];
    }
    
    [self.nonmemberprice setText:nonMemberPrice];
    [self.lblVanueNmae setText:[NSString stringWithFormat:@"%@",eventObject.loc]];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
    
    if([eventObject.startDate isEqualToDate:eventObject.endDate])
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
    [self setNonmemberprice:nil];
    [self setLblpricenonmember:nil];
    [self setLblcaploc:nil];
    [self setLblcapvalue:nil];
    [self setLblcapmemberprice:nil];
    [self setLblcapnonmemberprice:nil];
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
    [nonmemberprice release];
    [lblpricenonmember release];
    [lblcaploc release];
    [lblcapvalue release];
    [lblcapmemberprice release];
    [lblcapnonmemberprice release];
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
