//
//  Image.m
//  CodeSample
//
//  Created by Khoa Le on 5/2/14.
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import "MyImage.h"

@implementation MyImage
- (id)init
{
    self = [super init];
    if (self) {
        self.id_string = @"";
        self.url=@"";
    }
    return self;
}
-(id) initWithId: (NSString *) id_string_
         withUrl: (NSString *) url_{
    self = [super init];
    if (self) {
        self.id_string = id_string_;
        self.url = url_;
    }
    return self;
}

@end
