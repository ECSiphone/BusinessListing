//
//  DatabaseHelper.h
//  SBAMobile
//
//  Created by Vivek paliwal on 01/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CompanyObject.h"
#import "EventObject.h"

@interface DatabaseHelper : NSObject
{
   // NSString *databaseName;
   // NSString *databasePath;
    
    
}

+(void)checkAndCreateDatabse;
+(void)copyDatabaseAtPath;
-(NSMutableArray *)readNewsFromDatabase;
-(NSMutableArray *)readCategoryFromDatabase;

-(NSMutableArray *)companiesListServiceWithCategory:(int)catid andKey:(NSString *)key;
-(NSMutableArray *)companiesListServiceWithCategory:(int)catid;
-(NSMutableArray *)companiesListServiceWithKey:(NSString *)key;
-(NSMutableArray *)readEventFromDatabse;


-(CompanyObject *)comapnyDetailWithCompanyId:(int)comid;
//-(EventObject *)eventDeatilWithEventId:(int)eveid;


@end
