//
//  RecipesViewController.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "RecipesViewController.h"

@interface RecipesViewController (){
    DGActivityIndicatorView *activityIndicatorView;
    UILabel *waiting;
}

@end

@implementation RecipesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Recipes";
    [self.recipesTable setDelegate:self];
    [self.recipesTable setDataSource:self];
    self.recipesTable.hidden = YES;
    
    self.recipes = [NSMutableArray new];
    self.recipePresenter = [[RecipePresenter alloc]initWithRecipeView:self];
    [self.recipePresenter defineRecipePresenter];
    
    SearchTableViewController *stvc = [self.storyboard instantiateViewControllerWithIdentifier:@"STVC"];
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:stvc];
    self.searchController.searchResultsUpdater = stvc;
    [self.searchControllerContainer addSubview:self.searchController.searchBar];
    self.searchController.searchBar.delegate = stvc;
    self.searchController.searchBar.barTintColor = [UIColor blackColor];
    self.searchController.obscuresBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.recipes.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.recipeName.text = self.recipes[indexPath.row].label;
    cell.recipeSource.text = self.recipes[indexPath.row].source;
    cell.recipeHealth.text = self.recipes[indexPath.row].healthLabels;
    NSURL *url = [[NSURL alloc] initWithString:self.recipes[indexPath.row].image];
    [cell.recipeImg sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"images.png"]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.recipePresenter setRecipe:self.recipes[indexPath.row]];
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == self.recipes.count-5){
        [_recipePresenter getRecipes];
    }
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

-(void) showLoading{
    self.recipes = [NSMutableArray new];
    [self.recipesTable reloadData];
    self.recipesTable.hidden = YES;
    self.notesText.hidden = YES;
    
    activityIndicatorView = [[DGActivityIndicatorView alloc] initWithType:DGActivityIndicatorAnimationTypeCookieTerminator tintColor:[UIColor whiteColor] size:20.0f];
    activityIndicatorView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
    activityIndicatorView.size = 100.0;
    [self.view addSubview:activityIndicatorView];
    [activityIndicatorView startAnimating];
    activityIndicatorView.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, [[UIScreen mainScreen]bounds].size.height/2);
    
    waiting = [[UILabel alloc]initWithFrame:CGRectMake(0 , 0, 150, 40)];
    waiting.text = @"Getting Recipes...";
    waiting.textColor = [UIColor whiteColor];
    [self.view addSubview:waiting];
    waiting.center = CGPointMake([[UIScreen mainScreen]bounds].size.width/2, ([[UIScreen mainScreen]bounds].size.height/2) + 100);
}
-(void) hideLoading{
    [activityIndicatorView stopAnimating];
    [activityIndicatorView removeFromSuperview];
    [waiting removeFromSuperview];
    self.recipesTable.hidden = NO;
    self.recipes = [NSMutableArray new];
}

-(void) showAlertNoInternet{
    UIAlertController * alert = [UIAlertController
                                 alertControllerWithTitle:@"Cellular Data is Turned Off"
                                 message:@"Turn on cellular data or use Wi-Fi to access data."
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okButton = [UIAlertAction
                                actionWithTitle:@"ok"
                                style:UIAlertActionStyleDefault
                                handler:nil];
    [alert addAction:okButton];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void) showErrorMessage : (NSString*) errorMessage{
    [activityIndicatorView stopAnimating];
    [activityIndicatorView removeFromSuperview];
    [waiting removeFromSuperview];
    self.recipesTable.hidden = YES;
    self.notesText.hidden = NO;
    self.notesText.text = errorMessage;
}
-(void) goToDetails{
    DetailsTableViewController *DTVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DTVC"];
    [self.navigationController pushViewController:DTVC animated:YES];
}

-(void) renderRecipesWithObjects : (NSMutableArray*) recipes{
    [self.recipes addObjectsFromArray:recipes];
    [self.recipesTable reloadData];
}

-(void) updateSearchBar:(NSString*)search{
    self.searchController.active = NO;
    self.searchController.searchBar.text = search;
}



@end
