//
//  ViewController.m
//  StoreSearch
//
//  Created by Su Sheng Loong on 7/22/13.
//  Copyright (c) 2013 Su Sheng Loong. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchResult.h"

@interface SearchViewController ()
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@end

@implementation SearchViewController {
    NSMutableArray *searchResults;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (searchResults == nil) {
        return 0;
    } else {
        return [searchResults count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SearchResultCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    SearchResult *searchResult = [searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = searchResult.name;
    cell.detailTextLabel.text = searchResult.artistName;
    
    return cell;
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    
    searchResults = [NSMutableArray arrayWithCapacity:10];
    
    for (int i = 0; i < 3; i++) {
        SearchResult *searchResult = [[SearchResult alloc] init];
        searchResult.name = [NSString stringWithFormat:@"Fake Result %d for", i];
        searchResult.artistName = searchBar.text;
        [searchResults addObject:searchResult];
    }
    
    [self.tableView reloadData];
}

@end
