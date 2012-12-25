//
//  main.m
//  hostie
//
//  Created by Oliver Hirst on 20/11/2012.
//  Copyright (c) 2012 TwentyFathoms. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TFStringHandlers.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        char *lvalue = NULL;
        char *rvalue = NULL;
        char *comment = NULL;
        NSString *strLeft;
        NSString *strRight;
        NSString *strComment;
        int c;
        
        opterr = 0;
        
        while ((c = getopt (argc, argv, "l:r:c:")) != -1)
            switch (c)
        {
            case 'l':
                lvalue = optarg;
               strLeft = [NSString stringWithCString:lvalue encoding:NSStringEncodingConversionAllowLossy];
                break;
            case 'r':
                rvalue = optarg;
                strRight = [NSString stringWithCString:rvalue encoding:NSStringEncodingConversionAllowLossy];

                break;
            case 'c':
                comment = optarg;
                strComment = [NSString stringWithCString:comment encoding:NSStringEncodingConversionAllowLossy];
                break;
            case '?':
                if (optopt == 'c' || optopt == 'l' || optopt == 'r')
                    fprintf (stderr, "Option -%c requires an argument.\n", optopt);
                else if (isprint (optopt))
                    fprintf (stderr, "Unknown option `-%c'.\n", optopt);
                else
                    fprintf (stderr,
                             "Unknown option character `\\x%x'.\n",
                             optopt);
                return 1;
            default:
                abort ();
        }
        
        NSString *hostsEntry = [TFStringHandlers generateHostsEntryForLeftEntry:strLeft rightEntry:strRight comment:strComment];
        
        NSLog(@"\n \n \n FINAL ENTRY = [%@]", hostsEntry);
        
        [TFStringHandlers writeString:hostsEntry];
        
        
        
        // insert code here...
     //   NSLog(@"Hello, World!");
        
    }
    return 0;
}






