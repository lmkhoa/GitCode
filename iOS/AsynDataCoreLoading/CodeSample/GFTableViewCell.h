//
//  GFTableViewCell.h
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyImage.h"
@interface GFTableViewCell : UITableViewCell

@property(nonatomic, strong) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) MyImage *image;
@end
