//
//  ViewController.m
//  CodeSample
//
//  Copyright (c) 2014 Khoa Le, Inc. All rights reserved.
//

#import "ViewController.h"
#import "DataLoader.h"
#import "GFTableViewCell.h"
#import "MyImage.h"
#import "Helpers.h"
@interface ViewController ()
@property(nonatomic, strong) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *tableData;
@property(nonatomic, strong) DataLoader *data;
@property NSUInteger tableCount;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data = [[DataLoader alloc] dataLoaderWithDelegate:self];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [self refreshData];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)dismissKeyboard
{
    [self.searchBar resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GFTableViewCell *newCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    MyImage *image = [self.tableData objectAtIndex:indexPath.row];
    [newCell setImage:image];
    newCell.title.text = image.id_string;

    return newCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableCount;
}
#pragma mark UITableViewDelegate

// TODO:

#pragma mark Helper Methods

- (void)refreshData
{
    [_data getData:^(NSError *error){
        self.tableData = _data.images;
        NSLog(@"Refresh data herer");
        [[self tableView] reloadData];
    }];
    
    
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    self.tableCount=0;
    self.tableData = nil;
    NSLog(@"Key word %@",self.searchBar.text);
    // Do the search...
    self.data.keyWord = self.searchBar.text;
    [_data getData:^(NSError *error){
        self.tableData = _data.images;
        [[self tableView] reloadData];
    }];
   
    
}


#pragma mark Action Methods

- (IBAction)refreshAction:(id)sender
{
   [self refreshData];
   
}

#pragma mark Delegate Methods

-(void)receivedData:(NSDictionary *)data
{
    NSLog(@"in receivedData ");

}

-(void)updateCount:(NSUInteger)newCount
{
    NSLog(@"in updateCount ");
    self.tableCount = newCount;
}

@end
