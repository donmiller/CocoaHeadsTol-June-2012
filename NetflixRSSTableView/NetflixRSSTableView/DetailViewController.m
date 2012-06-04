//
//  DetailViewController.m
//  NetflixRSSTableView
//
//  Created by Don Miller on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize item, itemTitle, itemSummary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.itemTitle.text = [item objectForKey:@"title"];
    [self.itemSummary loadHTMLString:[item objectForKey:@"summary"] baseURL:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.item = nil;
    self.itemTitle = nil;
    self.itemSummary = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
