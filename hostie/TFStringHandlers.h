//
//  TFStringHandlers.h
//  hostie
//
//  Created by Oliver Hirst on 20/11/2012.
//  Copyright (c) 2012 TwentyFathoms. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TFStringHandlers : NSString



+(NSString *)generateHostsEntryForLeftEntry:(NSString *)leftEntry rightEntry:(NSString*)rightEntry comment:(NSString *)commentString;
+(void)writeString:(NSString *)string;


@end