//
//  main.m
//  RSSConsoleExample
//
//  Created by Don Miller on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool 
    {
        NSString *path = @"http://rss.netflix.com/Top100RSS";
        
        // Initialize Parser class and run parseXMLFileAtURL
        Parser *myParser = [[Parser alloc] init];
        [myParser parseXMLFileAtURL:path];
        
        return 0;
    }
    return 0;
}

