//
//  ParseHelper.m
//  CodeSample
//
//  Created by Khoa Le on 5/2/14.
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import "ParseHelper.h"
#import "ImageHelper.h"
#import "MyImage.h"
@implementation ParseHelper

+(NSMutableArray *) parseDataWithJSON:(NSDictionary *) jsonString{
    NSMutableArray *images = [[NSMutableArray alloc] init];
    NSDictionary *data = [jsonString objectForKey:@"data"];
    NSArray *children = [data objectForKey:@"children"];
    for (NSDictionary *child in children) {
        NSDictionary *item = [child objectForKey:@"data"];
        NSString *id_image = [item objectForKey:@"id"];
        NSString *urlString = [item objectForKey:@"thumbnail"];
        MyImage *image = [[MyImage alloc] initWithId:id_image withUrl:urlString];
        [ImageHelper updateDatabaseWithImage:image];
        [images addObject:image];
    }
    return images;
    
}

@end
