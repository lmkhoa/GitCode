//
//  DataReceiver.h
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataReceiver<NSObject>

-(void)receivedData:(NSArray *)data;
-(void)updateCount:(NSUInteger)newCount;


@end