//
//  EventList.m
//  SBAMobile
//
//  Created by Vivek paliwal on 30/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "EventList.h"
#import "EventListCell.h"
#import "EventDetailScreen.h"

@interface EventList ()

@end

@implementation EventList
@synthesize tblEvent;
@synthesize eventCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    [[NSBundle mainBundle]loadNibNamed:@"EventListCell" owner:self options:nil];
    EventListCell *cell=self.eventCell;
    cell.delegate=self;
    return cell;

}

-(void)clickedToAdd
{
// TODO : code to add event into calenderl;
    
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Event Is Added To Your iCal." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];


}


-(void)ClickedToDetail
{
   
    EventDetailScreen *detail=[[EventDetailScreen alloc]initWithEventId:1];
    [self.navigationController pushViewController:detail animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTblEvent:nil];
    [self setEventCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [tblEvent release];
    [eventCell release];
    [super dealloc];
}
- (IBAction)clickedToGoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
