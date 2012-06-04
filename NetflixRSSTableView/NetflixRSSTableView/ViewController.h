//
//  ViewController.h
//  NetflixRSSTableView
//
//  Created by Don Miller on 6/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *items;
}

@property (retain, nonatomic) NSMutableArray *items;
- (void)loadData;

@end
