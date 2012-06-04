//
//  Parser.h
//  RSSParser
//
//  Created by macuser on 12/16/11.
//  Copyright 2011 University of Toledo. All rights reserved.
//

#import <Foundation/Foundation.h>

// We need to inherit from the NSXMLParserDelegate to handle the delegate in the m file
@interface Parser : NSObject <NSXMLParserDelegate> {
    
	NSXMLParser * rssParser;
	
	NSMutableArray * movies;
    
	// a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
	
	// it parses through the document, from top to bottom...
	// we collect each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "movies" array
	NSString * currentElement;
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
    
}

@property (nonatomic, retain) NSMutableArray *movies;
-(void) parseXMLFileAtURL:(NSString *)URL;

@end
