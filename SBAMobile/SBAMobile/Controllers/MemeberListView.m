//
//  MemeberListView.m
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "MemeberListView.h"
#import "CompanyObject.h"
#import "DatabaseHelper.h"
#import  "CompanyDetailScreen.h"

@interface MemeberListView ()

@end

@implementation MemeberListView
@synthesize categoryId;
@synthesize categoryTitle;
@synthesize companyArray;



-(id)initWithCategoryId:(int)catid andCategoryName:(NSString *)catstring
{

    self=[self initWithNibName:@"MemeberListView" bundle:nil];
    self.categoryTitle=catstring;
    self.categoryId=catid;
    return self;
}

- (IBAction)clickedToGoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)clickedToGoHome:(id)sender {
    
     [self.navigationController popToRootViewControllerAnimated:YES];
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
    if([self.companyArray count]==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"SBA" message:@"There is no member found for this category.Please browse any other category." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    
    }
    return [self.companyArray count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    CompanyObject *comObject=(CompanyObject *)[self.companyArray objectAtIndex:[indexPath row]];
    cell.textLabel.text= comObject.name;
    
    
    cell.detailTextLabel.text=comObject.description;
    
    UIFont *regularfont=[UIFont fontWithName:@"candara" size:20.0f];
    UIFont *smallfont=[UIFont fontWithName:@"candara" size:14.0f];
    
    UIColor *blue=[UIColor colorWithRed:0.192f green:0.341f blue:.596f alpha:1.0];
    [cell.textLabel setTextColor:blue];
    [cell.detailTextLabel setTextColor:blue];
    
    
    [cell.textLabel setFont:regularfont];
    [cell.detailTextLabel setFont:smallfont];
    
    
    [cell.detailTextLabel setNumberOfLines:3];
    
    UIImageView *imagev=[[[UIImageView alloc]initWithFrame:CGRectMake(312, 45, 5, 10)]autorelease];
    [imagev setImage:[UIImage imageNamed:@"arrow.png"]];
    
    [cell addSubview:imagev];
    
    
    
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [NSString stringWithFormat:@"Member List for %@",self.categoryTitle];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    CompanyObject *object=(CompanyObject *)[self.companyArray objectAtIndex:[indexPath row]];  
    CompanyDetailScreen *detail=[[CompanyDetailScreen alloc]initWithCompanyId:object.comId];  
    [self.navigationController pushViewController:detail animated:YES];
    
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{

  if(buttonIndex==0)
  {
  
      [self.navigationController popViewControllerAnimated:YES];
  
  }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.companyArray=[[NSMutableArray alloc]init];
    DatabaseHelper *helper=[[DatabaseHelper alloc]init];
    self.companyArray=[helper companiesListServiceWithCategory:self.categoryId];
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

@end
