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
#import "EventObject.h"
#import "DatabaseHelper.h"

@interface EventList ()

@end

@implementation EventList
@synthesize tblEvent;
@synthesize eventCell;
@synthesize eventArray;

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
   if([self.eventArray count]==0)
   {
       UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"SBA" message:@"There is currently no event available." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
       [alert show];
   }
    return [self.eventArray count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    [[NSBundle mainBundle]loadNibNamed:@"EventListCell" owner:self options:nil];
    EventListCell *cell=self.eventCell;
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    EventObject *object=(EventObject *)[self.eventArray objectAtIndex:[indexPath row]];
    [cell bindDataWithEventObject:object];
    cell.delegate=self;
    return cell;

}

-(void)clickedToAdd
{
// TODO : code to add event into calenderl;
    


}


-(void)ClickedToDetail:(EventObject *)eve
{
   
    EventDetailScreen *detail=[[EventDetailScreen alloc]initWithEvent:eve];
    [self.navigationController pushViewController:detail animated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.eventArray=[[NSMutableArray alloc]init];
    
    DatabaseHelper *helper=[[DatabaseHelper alloc]init];
    self.eventArray=[helper readEventFromDatabse];
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

- (IBAction)clickedToGoHome:(id)sender {
    
     [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)clickedToAddAllEvents:(id)sender {
    
    
    for(int i=0; i<[eventArray count];i++)    
    {  
        EventObject *object=(EventObject *)[self.eventArray objectAtIndex:i];
        
        EKEventStore *eventStore = [[EKEventStore alloc] init];
        
        EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
        event.title     = object.name;
        event.startDate = object.startDate;
        event.endDate   = object.endDate;
        
        [event setCalendar:[eventStore defaultCalendarForNewEvents]];
        NSError *err;
        [eventStore saveEvent:event span:EKSpanThisEvent error:&err];       
    }
    
    
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Events Are Added To Your iCal." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

    
}
@end
