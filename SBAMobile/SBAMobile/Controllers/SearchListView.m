//
//  SearchListView.m
//  SBAMobile
//
//  Created by Vivek paliwal on 28/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "SearchListView.h"


@interface SearchListView ()

@end

@implementation SearchListView
@synthesize resultTbl;
@synthesize companyNameArray;
@synthesize descArray;

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

    return  [self.companyNameArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.textLabel.text=[self.companyNameArray objectAtIndex:[indexPath row]];
    cell.detailTextLabel.text=[self.descArray objectAtIndex:[indexPath row]];
    [cell.detailTextLabel setNumberOfLines:NSIntegerMax];
    
    return cell;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.descArray=[[NSMutableArray alloc]init];
    [self.descArray addObject:@"Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1Desc1"];
    [self.descArray addObject:@"Desc2"];
    
    self.companyNameArray=[[NSMutableArray alloc]init];
    [self.companyNameArray addObject:@"Compny1"];
    [self.companyNameArray addObject:@"Compny2"];
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setResultTbl:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [resultTbl release];
    [super dealloc];
}
- (IBAction)clickToBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
