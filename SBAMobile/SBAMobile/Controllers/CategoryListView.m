//
//  CategoryListView.m
//  SBAMobile
//
//  Created by Vivek paliwal on 29/08/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "CategoryListView.h"
#import "MemeberListView.h"
#import "DatabaseHelper.h"
#import "CategoryObject.h"

@interface CategoryListView ()

@end

@implementation CategoryListView
@synthesize tblCategory;
@synthesize categoryArray;

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
    
    if([self.categoryArray count]==0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"SBA" message:@"No Category Found" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    
    }

    return [self.categoryArray count];

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    CategoryObject *catObject=(CategoryObject *)[self.categoryArray objectAtIndex:[indexPath row]];
    
    UIFont *regularfont=[UIFont fontWithName:@"candara" size:17.0f];
    UIFont *smallfont=[UIFont fontWithName:@"candara" size:14.0f];
    
    [cell.textLabel setFont:regularfont];
    [cell.detailTextLabel setFont:smallfont];
    [cell.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png",catObject.catId]]];
    
    [cell.imageView setBackgroundColor:[UIColor clearColor]];
    
    ///
    UIColor *blue=[UIColor colorWithRed:0.192f green:0.341f blue:.596f alpha:1.0];
    [cell.textLabel setTextColor:blue];
    [cell.detailTextLabel setTextColor:blue];

    ///
    cell.textLabel.text=catObject.categoryName;
    [cell.textLabel setNumberOfLines:NSIntegerMax];
    
    UIImageView *imagev=[[[UIImageView alloc]initWithFrame:CGRectMake(312, 20, 5, 10)]autorelease];
    [imagev setImage:[UIImage imageNamed:@"arrow.png"]];
    [cell addSubview:imagev];
    
    return cell;

}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

     return @"Categories";

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CategoryObject *catObject=(CategoryObject *)[self.categoryArray objectAtIndex:[indexPath row]];
    MemeberListView *list=[[MemeberListView alloc]initWithCategoryId:catObject.catId andCategoryName:catObject.categoryName];
    [self.navigationController pushViewController:list animated:YES];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.categoryArray=[[NSMutableArray alloc]init];
    DatabaseHelper *helper=[[DatabaseHelper alloc]init];
    self.categoryArray=[helper readCategoryFromDatabase];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setTblCategory:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [tblCategory release];
    [super dealloc];
}
- (IBAction)clickedToGoBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (IBAction)clickedToGoHome:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
   if(buttonIndex==0)
  {

    [self.navigationController popViewControllerAnimated:YES];


  }
}
@end
