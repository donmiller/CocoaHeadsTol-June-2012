//
//  main.m
//  RSSParser
//
//  Created by macuser on 12/16/11.
//  Copyright 2011 University of Toledo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"

int main (int argc, const char * argv[])
{

    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    NSString *path = @"http://rss.netflix.com/Top100RSS";
    
    // Initialize Parser class and run parseXMLFileAtURL
    Parser *myParser = [[Parser alloc] init];
    [myParser parseXMLFileAtURL:path];

    [pool drain];
    return 0;
}

