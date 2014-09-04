//
//  FileAccess.h
//  ProtocoloYDelegado
//
//  Created by Developer Cymetria on 19/08/14.
//  Copyright (c) 2014 Giovanny Suarez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileAccessDelegate.h"

@interface FileAccess : NSObject

@property (strong, nonatomic) id <FileAccessDelegate> delegate;


-(void)descargarArchivo:(NSString*)url nombre:(NSString*)nombre;

+(NSString*)removeFileBookWithName:(NSString*)name;

@end
