//
//  Helpers.m
//  CodeSample
//
//  Created by Triet Le on 5/3/14.
//  Copyright (c) 2014 Golden Frog, Inc. All rights reserved.
//

#import "Helpers.h"

@implementation Helpers
+(BOOL) validUrl:(NSString *) url_string{
    NSURL *candidateURL = [NSURL URLWithString:url_string];
    if (candidateURL && candidateURL.scheme && candidateURL.host) {
        return true;
    }else return false;

}


@end
