//
//  DetailViewController.h
//  NetflixRSSTableView
//
//  Created by Don Miller on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
	NSDictionary *item;
	IBOutlet UILabel *itemTitle;
	IBOutlet UIWebView *itemSummary;
}

@property (nonatomic, retain) NSDictionary *item;
@property (nonatomic, retain) IBOutlet UILabel *itemTitle;
@property (nonatomic, retain) IBOutlet UIWebView *itemSummary;

@end
