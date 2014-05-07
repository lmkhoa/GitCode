//
//  ImageHelper.h
//  CodeSample
//
//  Created by Khoa Le on 5/2/14.
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyImage.h"
@interface ImageHelper : NSObject

+(UIImage *) getImageWithUrl:(NSString *) url;
+(void) updateDatabaseWithImage:(MyImage *) image;
+(void) updateExistingImage:(MyImage *) image withData:(NSData *) img;
+(void) saveNewImage:(MyImage *) image withData:(NSData *) img;

@end
