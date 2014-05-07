//
//  DataLoader.h
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DataReceiver.h"

@interface DataLoader : NSObject
@property(nonatomic, strong) NSMutableArray *images;
@property(nonatomic, strong) NSString *keyWord;
- (id)dataLoaderWithDelegate:(id<DataReceiver>)delegate;
- (void)getData:(void(^)(NSError *error))onComplete;

@end
