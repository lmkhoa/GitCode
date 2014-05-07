//
//  DataLoader.m
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import "DataLoader.h"
#import "ParseHelper.h"
#import "LoadCounter.h"
#import "MyImage.h"

@interface DataLoader ()
@property(nonatomic, strong) id<DataReceiver> loadDelegate;
@property(nonatomic, strong) NSArray *data;

@end

@implementation DataLoader

- (id)dataLoaderWithDelegate:(id<DataReceiver>)delegate
{
    DataLoader *loader = [[DataLoader alloc] init];
    loader.loadDelegate = delegate;
    
    return loader;
}

- (void)getData:(void(^)(NSError *error))onComplete
{
    // TODO: Add a parameter that is entered in a search field at the top of the table view.
    // You will need to add this search field, grab the search value, and use this value as the search term.
    NSString *searchTerm = ([self.keyWord isEqualToString:@""]|| self.keyWord == NULL)? @"ferrari":self.keyWord; // default search term
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.reddit.com/search.json?q=%@", [searchTerm stringByReplacingOccurrencesOfString:@" " withString:@"%20"]]]];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error){
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSDictionary *apiResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            self.images = [ParseHelper parseDataWithJSON:apiResponse];
            NSDictionary *apiData = apiResponse[@"data"];
            NSArray *apiChildren = apiData[@"children"];
            self.data = apiChildren;
            [self.loadDelegate updateCount:self.data.count];
            [self.loadDelegate receivedData:self.data];
            onComplete(error);
        });
        
        
    }];
    
    
    
}

@end
