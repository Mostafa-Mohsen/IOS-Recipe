//
//  RecipesViewController.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "RecipesViewController.h"

@interface RecipesViewController ()

@end

@implementation RecipesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Recipes";
    [self.recipesTable setDelegate:self];
    [self.recipesTable setDataSource:self];
    
    self.recipes = [NSMutableArray new];
    self.recipePresenter = [[RecipePresenter alloc]initWithRecipeView:self];
    
    /////////////////////////////////////////////
    [self.recipePresenter getRecipes:@"chicken"];
    
    
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

}
-(void) hideLoading{
    
}
-(void) showErrorMessage : (NSString*) errorMessage{
    
}

-(void) renderRecipesWithObjects : (NSMutableArray*) recipes{
    self.recipes = recipes;
    NSLog(@"%@",self.recipes[0].label);
    [self.recipesTable reloadData];
}

@end
