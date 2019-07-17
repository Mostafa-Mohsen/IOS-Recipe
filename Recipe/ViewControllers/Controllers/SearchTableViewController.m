//
//  SearchTableViewController.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchPresenter = [[SearchPresenter alloc]initWithRecipeView:self];
//    self.navigationItem.titleView = self.searchBar;
}

-(void)viewWillAppear:(BOOL)animated{
    self.suggestions = [NSArray new];
    [self.searchPresenter getSuggestions];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.suggestions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = self.suggestions[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.searchBar.text = self.suggestions[indexPath.row];
    [self searchBarSearchButtonClicked:self.searchBar];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)updateSearchResultsForSearchController:(nonnull UISearchController *)searchController {
    if(searchController.isActive){
        searchController.searchResultsController.view.hidden = NO;
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    self.searchBar = searchBar;
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    //send to presenter to service
    [self.searchPresenter searchBarSearchButtonClicked:searchBar.text];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self.searchPresenter searchBarTextDidChange:searchText];
}

- (void)updateData:(NSArray*)suggestions{
    self.suggestions = suggestions;
    [self.tableView reloadData];
}

@end
