//
//  FileAccess.m
//  ProtocoloYDelegado
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import "FileAccess.h"
@interface FileAccess() <NSURLConnectionDataDelegate>
    @property long long expectedLength;
    @property NSMutableData * fileData;
    @property NSString * fileName;
@end

@implementation FileAccess
static float progress = 0.0f;

#pragma mark Metodos del NSURLConectionDataDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _expectedLength = [response expectedContentLength];
    progress = 0;
    if ([self.delegate respondsToSelector:@selector(downloadInitLoading:didReceiveResponse:)]) {
        
        [self.delegate downloadInitLoading:connection didReceiveResponse:response];
    }
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    progress +=[data length];
    [_fileData appendData:data];
    if ([self.delegate respondsToSelector:@selector(downloadChangeLoading:didReceiveData:andProgress:)]) {
        [self.delegate downloadChangeLoading:connection didReceiveData:data andProgress:(progress/(float)_expectedLength)];
    }
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if ([self.delegate respondsToSelector:@selector(downloadFinishLoading:andName:)]) {
        [self.delegate downloadDidFinishLoading:_fileName];
    }
    
    //Metodo que me guarde el archivo en Documents
    [self saveDocuments:_fileData andName:_fileName];

}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    if ([self.delegate respondsToSelector:@selector(downloadFinishLoading:didFailWithError:andName:)]) {
        [self.delegate downloadFinishLoading:connection didFailWithError:error andName:_fileName];
    }
}
#pragma mark Metodos Privado
-(void)saveDocuments:(NSData*)imageData andName:(NSString*)name{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * carpetaFotos = [[paths lastObject] stringByAppendingPathComponent:@"/file"];
    BOOL isDir = NO;
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    if (![fileManager fileExistsAtPath:carpetaFotos isDirectory:&isDir] && isDir==NO) {
        
        [fileManager createDirectoryAtPath:carpetaFotos withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    NSString * filePath = [carpetaFotos stringByAppendingPathComponent:name];
    NSError * writeError = nil;
    
    [imageData writeToFile:filePath options:NSDataWritingAtomic error:&writeError];
    
    if (writeError) {
        NSLog(@"Error: %@",writeError);
        [_delegate downloadFinishLoading:nil didFailWithError:writeError andName:_fileName];
    }
    
    [_delegate downloadFinishLoading:filePath andName:_fileName];
}


#pragma mark Metodos de la Clase
-(void)descargarArchivo:(NSString*)url nombre:(NSString*)nombre{
    _fileName = nombre;
    _fileData = [[NSMutableData alloc] init];
    
    NSURL * urlData = [NSURL URLWithString:url];
    NSURLRequest * request = [NSURLRequest requestWithURL:urlData];
    
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    [connection start];

}

+(NSString*)removeFileBookWithName:(NSString*)name{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * basePath = ([paths count]>0) ? [paths objectAtIndex:0] : nil;
    
    NSString * pathDelete = [basePath stringByAppendingString:@"/file/"];
    pathDelete = [pathDelete stringByAppendingString:name];
    
    NSFileManager * fm = [[NSFileManager alloc] init];
    
    
    NSError * error;
    
    [fm removeItemAtPath:pathDelete error:&error];
    
    if (error) {
        NSLog(@"Error Borrando Archivo: %@", error);
    }
    
    NSLog(@"Borrado Exitoso");
    return [NSString stringWithFormat:@"Borrado Exitoso"];
}


@end
