//
//  FileAccessDelegate.h
//  ProtocoloYDelegado
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FileAccessDelegate <NSObject>

@optional

//descarga finaliza dependiendo de la ruta y el nombre
-(void)downloadFinishLoading:(NSString*)filePath andName:(NSString*)name;

//descarga finaliza, parametro nombre del archivo
-(void)downloadDidFinishLoading:(NSString*)name;

//descarga finaliza, parametro conexion, error y el nombre del archivo
-(void)downloadFinishLoading:(NSURLConnection*)connection didFailWithError:(NSError*)error andName:(NSString*)name;

//Controlar el porcentaje de carga
-(void)downloadChangeLoading:(NSURLConnection*)connection didReceiveData:(NSData*)data andProgress:(float)progress;

//Inicio de la descarga
-(void)downloadInitLoading:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response;
@end
