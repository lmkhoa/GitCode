//
//  ViewController.h
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DataReceiver.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, DataReceiver, UISearchBarDelegate>

@end
