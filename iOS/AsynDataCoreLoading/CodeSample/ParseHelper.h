//
//  ParseHelper.h
//  CodeSample
//
//  Created by Triet Le on 5/2/14.
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseHelper : NSObject
+(NSMutableArray *) parseDataWithJSON:(NSDictionary *) jsonString;
@end
