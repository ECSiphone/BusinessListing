//
//  SearchListView.m
//  SBAMobile
//
//  Created by Vivek paliwal on 28/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "SearchListView.h"
#import "DatabaseHelper.h"
#import "CompanyObject.h"
#import "CompanyDetailScreen.h"


@interface SearchListView ()

@end

@implementation SearchListView
@synthesize resultTbl;
@synthesize keyWord;
@synthesize categoryId;
@synthesize companyObjectArray;



-(id)initWithCategoryIndex:(int)catid andKeyWord:(NSString *)key
{
    self=[self initWithNibName:@"SearchListView" bundle:nil];
    self.keyWord=key;
    self.categoryId=catid;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       
    if([self.companyObjectArray count]==0)      {
    UIAlertView *alert=[[[UIAlertView alloc]initWithTitle:@"SBA" message:@"There is no data found.Please Search again." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil]autorelease];
    [alert show];

}
    return  [self.companyObjectArray count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIFont *regularfont=[UIFont fontWithName:@"candara" size:17.0f];
    UIFont *smallfont=[UIFont fontWithName:@"candara" size:14.0f];
    
    
    UIColor *blue=[UIColor colorWithRed:0.192f green:0.341f blue:.596f alpha:1.0];
    
    
    
    UITableViewCell *cell= [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    CompanyObject *comapnyObj=(CompanyObject *)[self.companyObjectArray objectAtIndex:[indexPath row]];
    
    [cell.textLabel setFont:regularfont];
    [cell.detailTextLabel setFont:smallfont];
    
    [cell.textLabel setTextColor:blue];
    [cell.detailTextLabel setTextColor:blue];
    
    [cell.textLabel setText:comapnyObj.name];
    [cell.detailTextLabel setText:comapnyObj.description];
    
    [cell.detailTextLabel setNumberOfLines:NSIntegerMax];
    
    return cell;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    companyObjectArray=[[NSMutableArray alloc]init];
    DatabaseHelper *helper=[[DatabaseHelper alloc]init];
    
    if(!([self.keyWord isEqualToString:@""])&&(!(categoryId==0)))
    {
      self.companyObjectArray=[helper companiesListServiceWithCategory:categoryId andKey:self.keyWord];
    
    }
    else {
        if([self.keyWord isEqualToString:@""])
        {
           self.companyObjectArray=[helper companiesListServiceWithCategory:categoryId];        
        }
        else {
           self.companyObjectArray=[helper companiesListServiceWithKey:self.keyWord];
        }
        
    }
       
    
    
    // Do any additional setup after loading the view from its nib.
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CompanyObject *comapnyObj=(CompanyObject *)[self.companyObjectArray objectAtIndex:[indexPath row]];
    CompanyDetailScreen *scr=[[CompanyDetailScreen alloc]initWithCompanyId:comapnyObj.comId];
    [self.navigationController pushViewController:scr animated:YES];
   
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

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

 if(buttonIndex==0)
 {
 
     [self.navigationController popViewControllerAnimated:YES];
 
 }
}
@end
