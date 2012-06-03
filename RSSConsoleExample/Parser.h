//
//  Parser.h
//  RSSConsoleExample
//
//  Created by Don Miller on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject <NSXMLParserDelegate> 
{
	NSXMLParser *rssParser;
	NSMutableArray *movies;
	NSMutableDictionary *item;
	NSString *currentElement;
	NSMutableString *currentTitle, *currentDate;
	NSMutableString *currentSummary, *currentLink;
}

-(void) parseXMLFileAtURL:(NSString *)URL;

@end
