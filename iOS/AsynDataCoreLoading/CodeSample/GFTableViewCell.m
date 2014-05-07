//
//  GFTableViewCell.m
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import "GFTableViewCell.h"
#import "Helpers.h"
#import "ImageHelper.h"

@implementation GFTableViewCell
@synthesize imageView;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void) setImage:(MyImage *)image{
    if (![Helpers validUrl:image.url]) {
        self.imageView.image = [UIImage imageNamed:@"golden_frog.png"];
    }else{
        UIImage *img = [ImageHelper getImageWithUrl:image.url];
        if (img == NULL) {
            NSURL *url = [NSURL URLWithString:image.url];
            dispatch_queue_t callerQueue = dispatch_get_main_queue();
            dispatch_queue_t downloadQueue = dispatch_queue_create("myprocess", NULL);
            dispatch_async(downloadQueue, ^{
                NSLog(@"Start downloading");
                NSData * imageData = [NSData dataWithContentsOfURL:url];
                dispatch_async(callerQueue, ^{
                    self.imageView.image = [UIImage imageWithData:imageData];
                    [ImageHelper updateExistingImage:image withData:imageData];
                    
                });
            });

        }else{
            NSLog(@"Get cached photo");
            self.imageView.image=img;
        }
        
    }
}
@end
