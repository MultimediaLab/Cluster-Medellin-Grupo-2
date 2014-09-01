//
//  ViewController.m
//  SqlLite
//
//  Created by Profesor on 1/09/14.
//  Copyright (c) 2014 Profesor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString * databasePath;
    NSString * empID;
    NSInteger e_id;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString * docsDir;
    NSArray * dirPaths;
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = [dirPaths objectAtIndex:0];
    
    NSLog(@"%@", docsDir);
    
    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"contacts.db"]];
    NSFileManager * fm = [[NSFileManager alloc] init];
    
    if ([fm fileExistsAtPath:databasePath]==NO) {
        const char * dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &contactDB) == SQLITE_OK) {
            NSLog(@"BASE DE DATOS CREADA");
            char * errMsg;
            const char * sql_stmt = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, EMP_NO TEXT, EMP_NAME TEXT, EMP_AGE TEXT, EMP_ADRESSS TEXT)";
            if (sqlite3_exec(contactDB, sql_stmt, NULL, NULL, &errMsg)== SQLITE_OK) {
                //CREO LA TABLA EN LA BASE DE DATOS
                _status.text = @"Se creo la tabla";
            }
            sqlite3_close(contactDB);
        }else{
            NSLog(@"Error en crear base de datos");
        
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveData:(id)sender {
}

- (IBAction)readData:(id)sender {
}

- (IBAction)updateData:(id)sender {
}

- (IBAction)deleteData:(id)sender {
}
@end
