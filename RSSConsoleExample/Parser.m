//
//  Parser.m
//  RSSConsoleExample
//
//  Created by Don Miller on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Parser.h"

@implementation Parser

- (void)parseXMLFileAtURL:(NSString *)URL
{
    movies = [[NSMutableArray alloc] init];
    
    NSURL *xmlURL = [NSURL URLWithString:URL];	
    rssParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlURL];
    
    [rssParser setDelegate:self]; //Receive callbacks
    [rssParser parse];
}

- (void)parser:(NSXMLParser *)parser 
parseErrorOccurred:(NSError *)parseError 
{
	NSString *errorString = [NSString stringWithFormat:@"Unable to download movie feed from web site (Error code %i)", 
                             [parseError code]];
	NSLog(@"Error parsing XML: %@", errorString);
}

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
    attributes:(NSDictionary *)attributeDict
{			
    NSLog(@"Found this element: %@", elementName);
    currentElement = [elementName copy];
    if ([elementName isEqualToString:@"item"])
    {
        item = [[NSMutableDictionary alloc] init];
        currentTitle = [[NSMutableString alloc] init];
        currentSummary = [[NSMutableString alloc] init];
        currentLink = [[NSMutableString alloc] init];
    }	
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
{     
    NSLog(@"Ended element: %@", elementName);
    if ([elementName isEqualToString:@"item"]) 
    {
        // save values to an item, then store into array...
        [item setObject:currentTitle forKey:@"title"];
        [item setObject:currentLink forKey:@"link"];
        [item setObject:currentSummary forKey:@"summary"];
        
        [movies addObject:[item copy]];
        
        NSLog(@"Adding movie: %@", currentTitle);
        // NSLog(@"Summary: %@", currentSummary);
        // NSLog(@"Link: %@", currentLink);
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"Found characters: %@", string);
    
    // save the characters for the current item...
    if ([currentElement isEqualToString:@"title"])
    {
        [currentTitle appendString:string];
    } 
    else if ([currentElement isEqualToString:@"link"]) 
    {
        [currentLink appendString:string];
    } 
    else if ([currentElement isEqualToString:@"description"]) 
    {
        [currentSummary appendString:string];
    } 
}

- (void)parserDidEndDocument:(NSXMLParser *)parser 
{
    NSLog(@"All done!");
    NSLog(@"Movies array has %lu items", [movies count]);
}

@end
