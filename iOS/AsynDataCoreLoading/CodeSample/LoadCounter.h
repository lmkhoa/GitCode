//
//  LoadCounter.h
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol LoadCounter <NSObject>
- (void)loadCountUpdated:(NSUInteger)count;
@end
