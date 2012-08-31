//
//  DatabaseHelper.h
//  SBAMobile
//
//  Created by Vivek paliwal on 01/09/12.
//  Copyright (c) 2012 vivekplwl@gmail.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DatabaseHelper : NSObject
{
   // NSString *databaseName;
   // NSString *databasePath;
    
    
}

+(void)checkAndCreateDatabse;
+(void)copyDatabaseAtPath;
-(NSMutableArray *)readNewsFromDatabase;
-(NSMutableArray *)readCategoryFromDatabase;
-(NSMutableArray *)readCompanyFromDatabase;



@end
