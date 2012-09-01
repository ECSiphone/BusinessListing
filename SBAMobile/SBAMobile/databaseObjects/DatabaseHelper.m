//
//  DatabaseHelper.m
//  SBAMobile
//
//  Created by Vivek paliwal on 01/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import "DatabaseHelper.h"
#import "CategoryObject.h"
#import "NewsObject.h"
#import "CompanyObject.h"
#import <sqlite3.h>

#define DATABASEPATH  @"DATABASEPATH"


@implementation DatabaseHelper



+(void)checkAndCreateDatabse{
    
    //databaseName=@"db.sqlite";
    
    
    NSString *databasePath;
    NSString *databaseName=@"SBADatabase.sqlite";
    
	NSArray *documentPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDir=[documentPaths objectAtIndex:0];
	databasePath=[documentsDir stringByAppendingPathComponent:databaseName];
    
     NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults setObject:databasePath forKey:DATABASEPATH];
    [defaults synchronize];
    
    
    
    [DatabaseHelper copyDatabaseAtPath];
    
  //  return databasePath;

}

+(void)copyDatabaseAtPath{

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *dbPath=[defaults objectForKey:DATABASEPATH];
    
    BOOL success;
    NSString *databaseName=@"SBADatabase.sqlite";
	NSFileManager *fileManager=[NSFileManager defaultManager];
	success =[fileManager fileExistsAtPath:dbPath];
	if (success)
		return;
	
	NSString *databasePathFromApp=[[[NSBundle mainBundle]resourcePath]stringByAppendingPathComponent:databaseName];
	[fileManager copyItemAtPath:databasePathFromApp toPath:dbPath error:nil];
	[fileManager release];

}

-(NSMutableArray *)readCategoryFromDatabase
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *dbPath=[defaults objectForKey:DATABASEPATH];
    
    
    NSMutableArray *categoryArray=[[NSMutableArray alloc]init];
    sqlite3 *database;
	
	NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
	
    	
	// Open the database from the users filessytem
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from CategoryMaster order by categoryName asc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                
                int catid=sqlite3_column_int(compiledStatement, 0);
            
                NSString *catname=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                NSString *username=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                
                
                NSString *modstr=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                 
                NSDate *moddate=[formatter dateFromString:modstr];
                
                
                CategoryObject *catObject=[[CategoryObject alloc]initWithId:catid catName:catname userName:username andDate:moddate];
                
                [categoryArray addObject:catObject];
            }
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
    
    return categoryArray;
    
}



-(NSMutableArray *)readNewsFromDatabase{
    
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *dbPath=[defaults objectForKey:DATABASEPATH];
    
    
    NSMutableArray *newsArray=[[NSMutableArray alloc]init];
    sqlite3 *database;
	
	NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
	
    
	// Open the database from the users filessytem
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement = "select * from NewsMaster order by newsdate asc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                
                int newsid=sqlite3_column_int(compiledStatement, 0);
                
                NSString *newshead=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 1)];
                NSString *newscont=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                
                
                NSString *newdatestr=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                
                NSDate *newsdate=[formatter dateFromString:newdatestr];
                
                NSString *username=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 4)];
                
                
                NSString *modstr=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];
                
                NSDate *moddate=[formatter dateFromString:modstr];
                NewsObject *newsObject=[[NewsObject alloc]initWithid:newsid head:newshead cont:newscont date:newsdate user:username modDate:moddate];                
                [newsArray addObject:newsObject];
            }
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);

    return newsArray;




}
-(NSMutableArray *)readCompanyFromDatabase{
    
    NSMutableArray *companyArray=[self applyingQueryOnCompanyObject:@"select * from CompanyMaster order by CompanyName asc"];
    return companyArray;

}

-(NSMutableArray *)companiesListServiceWithCategory:(int)catid andKey:(NSString *)key
{

    NSMutableArray *companyArray=[self applyingQueryOnCompanyObject:@"select * from CompanyMaster order by CompanyName asc"];
    return companyArray;

}


-(NSMutableArray *)companiesListServiceWithCategory:(int)catid
{
    NSString *querystr=[NSString stringWithFormat:@"select * from CompanyMaster WHERE categoryId = %d order by CompanyName asc",catid];
    NSMutableArray *companyArray=[self applyingQueryOnCompanyObject:querystr];
    return companyArray;


}

-(NSMutableArray *)companiesListServiceWithKey:(NSString *)key
{





}


-(NSMutableArray *)applyingQueryOnCompanyObject:(NSString *)query
{

    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSString *dbPath=[defaults objectForKey:DATABASEPATH];
    
    
    NSMutableArray *companyArray=[[NSMutableArray alloc]init];
    sqlite3 *database;
	
	NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd/MM/yyyy"];
	
    
	// Open the database from the users filessytem
	if(sqlite3_open([dbPath UTF8String], &database) == SQLITE_OK) {
		// Setup the SQL Statement and compile it for faster access
		const char *sqlStatement =[query UTF8String]; //"select * from CompanyMaster order by CompanyName asc";
		sqlite3_stmt *compiledStatement;
		if(sqlite3_prepare_v2(database, sqlStatement, -1, &compiledStatement, NULL) == SQLITE_OK) {
			// Loop through the results and add them to the feeds array
			while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                
                int companyid=sqlite3_column_int(compiledStatement, 0);
                int catid=sqlite3_column_int(compiledStatement, 1);
                
                NSString *name=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 2)];
                
                NSString *add1=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 3)];
                
                NSString *zip=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement,4)];
                
                NSString *state=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 5)];
                
                NSString *city=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 12)];
                
                
                NSString *country=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 6)];
                
                NSString *phone=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 7)];
                NSString *fax=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 8)];
                NSString *user=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 9)];
                NSString *add2=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 11)];
                
                NSString *modstr=[NSString stringWithUTF8String:(char *)sqlite3_column_text(compiledStatement, 10)];
                
                NSDate *moddate=[formatter dateFromString:modstr];
                CompanyObject *companyObject=[[CompanyObject alloc]initWithComid:companyid catid:catid name:name add1:add1 add2:add2 zip:zip state:state city:city country:country phone:phone faxNo:fax user:user modDate:moddate];            
                [companyArray addObject:companyObject];
            }
		}
		// Release the compiled statement from memory
		sqlite3_finalize(compiledStatement);
		
	}
	sqlite3_close(database);
    
    return companyArray;
}



@end
