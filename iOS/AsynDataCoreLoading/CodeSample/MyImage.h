//
//  Image.h
//  CodeSample
//
//  Created by Khoa Le on 5/2/14.
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyImage : NSObject
@property (nonatomic,strong) NSString *id_string;
@property (nonatomic,strong) NSString *url;

-(id) initWithId: (NSString *) id_string_
         withUrl: (NSString *) url_;
@end
