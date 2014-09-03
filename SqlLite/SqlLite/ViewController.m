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
    
  
    
    databasePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"contacts.db"]];
      NSLog(@"%@", databasePath);
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
    if (_empNoTxt.text.length > 0 && _empNameTxt.text.length>0 && _empAgeTxt.text.length>0 && _empAdressTxt.text.length>0) {
        sqlite3_stmt * statement;
        const char * db = [databasePath UTF8String];
        if (sqlite3_open(db, &contactDB)== SQLITE_OK) {
            //Acceder a la BD
            NSString * insert = [[NSString alloc] initWithFormat:@"INSERT INTO CONTACTS (EMP_NO, EMP_NAME, EMP_AGE, EMP_ADRESSS) VALUES (\"%@\",\"%@\",\"%@\",\"%@\")", _empNoTxt.text, _empNameTxt.text, _empAgeTxt.text, _empAdressTxt.text];
            const char * insert_sql = [insert UTF8String];

            sqlite3_prepare_v2(contactDB, insert_sql, -1, &statement, NULL);
            if (sqlite3_step(statement)==SQLITE_DONE) {
                _status.text = @"Registro Almacenado con Exito!!";
                _empNoTxt.text = @"";
                _empNameTxt.text = @"";
                _empAgeTxt.text = @"";
                _empAdressTxt.text = @"";
            }else
            {
                _status.text = @"Error al almacenar registro";
            }
            sqlite3_finalize(statement);
            sqlite3_close(contactDB);
        }
        else{
            _status.text = @"No se pudo acceder a la bd";
        }
    }else{
        _status.text = @"Datos incompletos";
    }
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UIView * view in self.view.subviews) {
        [view resignFirstResponder];
    }
}

- (IBAction)readData:(id)sender {
    sqlite3_stmt * statement;
    const char * db = [databasePath UTF8String];
    if (sqlite3_open(db, &contactDB)== SQLITE_OK) {
        NSString * select = [NSString stringWithFormat:@"SELECT EMP_NAME, EMP_AGE, EMP_ADRESSS FROM CONTACTS WHERE EMP_NO = \"%@\"", self.empNoTxt.text];
        const char * select_sql = [select UTF8String];
        if (sqlite3_prepare_v2(contactDB, select_sql, -1, &statement, NULL)== SQLITE_OK) {
            if (sqlite3_step(statement)==SQLITE_ROW) {
                _status.text = @"Registro encontrado";
                _empNameTxt.text = [NSString stringWithFormat:@"%s", sqlite3_column_text(statement, 0)];
                _empAgeTxt.text = [NSString stringWithFormat:@"%s", sqlite3_column_text(statement, 1)];
                _empAdressTxt.text = [NSString stringWithFormat:@"%s", sqlite3_column_text(statement, 2)];
            }
            else{
                _status.text = @"Registro no encontrado";
            }
            sqlite3_finalize(statement);
        }
        else{
            _status.text=@"Error en el Query";
        }
        sqlite3_close(contactDB);
    }else{
        _status.text = @"No se pudo acceder a la bd";
    }
    
}

- (IBAction)updateData:(id)sender {
    sqlite3_stmt * statement;
    const char * db = [databasePath UTF8String];
    if (sqlite3_open(db,&contactDB)==SQLITE_OK){

        NSString * update = [[NSString alloc] initWithFormat:@"UPDATE CONTACTS SET EMP_NO = \"%@\", EMP_NAME = \"%@\", EMP_AGE = \"%@\", EMP_ADRESS = \"%@\" WHERE EMP_NO = \"%@\"",self.empNoTxt.text,self.empNameTxt.text,self.empAgeTxt.text,self.empAdressTxt.text,self.empNoTxt.text];
        const char * update_sql = [update UTF8String];
        
        sqlite3_prepare_v2(contactDB,update_sql,-1,&statement,NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            _status.text = @"Registro Actualizado con Exito!!";
        } else {
            _status.text = @"Error al actualizar registro";
        }
    }

}

- (IBAction)deleteData:(id)sender {
    sqlite3_stmt * statement;
    const char * db = [databasePath UTF8String];
    if (sqlite3_open(db,&contactDB)==SQLITE_OK){
        NSString * delete = [[NSString alloc] initWithFormat:@"DELETE FROM CONTACTS WHERE EMP_NO = \"%@\"",self.empNoTxt.text];
        const char * delete_sql = [delete UTF8String];
        
        sqlite3_prepare_v2(contactDB,delete_sql,-1,&statement,NULL);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            _status.text = @"Registro Eliminado con Exito!!";
            _empNoTxt.text = @"";
            _empNameTxt.text = @"";
            _empAgeTxt.text = @"";
            _empAdressTxt.text = @"";
            
        } else {
            _status.text = @"Error al eliminar registro";
        }
    }
}
@end
