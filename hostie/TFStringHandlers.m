//
//  TFStringHandlers.m
//  hostie
//
//  Created by Oliver Hirst on 20/11/2012.
//  Copyright (c) 2012 TwentyFathoms. All rights reserved.
//

#import "TFStringHandlers.h"

@implementation TFStringHandlers



+(NSString *)generateHostsEntryForLeftEntry:(NSString *)leftEntry rightEntry:(NSString*)rightEntry comment:(NSString *)commentString {
    
    NSString *finalStr = nil;
    
    finalStr = [[leftEntry stringByAppendingString:@"\t"] stringByAppendingString:rightEntry];
    
    if (commentString != nil) {
        finalStr = [[[finalStr stringByAppendingString:@"\t #"] stringByAppendingString:commentString] stringByAppendingString:@"\n"];
    }
    else {
        NSLog(@"No comment provided, ignoring: use the -c flag to provide a comment.\n");
    }
    return finalStr;
}

+(void)writeString:(NSString *)string {
    
    const char* cstr = [string cStringUsingEncoding:NSStringEncodingConversionAllowLossy];
    
    FILE *out = fopen("/etc/hosts", "a");
    fprintf(out, "%s", cstr);
    fclose(out);
}


@end
