//
//  DetailsTableViewController.m
//  Recipe
//
//  Created by Mostafa on 7/14/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "DetailsTableViewController.h"

@interface DetailsTableViewController ()

@end

@implementation DetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _detailsPresenter = [[DetailsPresenter alloc]initWithDetailsView:self];
    [_detailsPresenter getRecipe];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if(self.recipe){
        return (4+self.recipe.ingredientLines.count);
    }else{
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if(indexPath.row == 0){
        DetailsImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell1" forIndexPath:indexPath];
        NSURL *url = [[NSURL alloc] initWithString:self.recipe.image];
        [cell.recipeDetImg sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"images.png"]];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }else if(indexPath.row == 1){
        DetailsTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
        cell.recipeDetTitle.text = self.recipe.label;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }else if(indexPath.row == 2){
        DetailsIngredientsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell3" forIndexPath:indexPath];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
    }else if(indexPath.row == (3+self.recipe.ingredientLines.count)){
        DetailsLinkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell5" forIndexPath:indexPath];
        cell.recipeDetLink.text = self.recipe.url;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.recipeDetLink.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openSite)];
        [cell.recipeDetLink addGestureRecognizer:tapGesture];
        return cell;
    }else{
        DetailsSingleIngTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell4" forIndexPath:indexPath];
        cell.recipeDetSingleIng.text = self.recipe.ingredientLines[indexPath.row-3];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
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

-(void) showData:(Recipe*)recipe{
    self.recipe = recipe;
    [self.tableView reloadData];
}

-(void) openSite{
    NSURL *url = [[NSURL alloc] initWithString:self.recipe.url];
    SFSafariViewController *SCV = [[SFSafariViewController alloc]initWithURL:url];
    [self presentViewController:SCV animated:YES completion:nil];
}

- (void)safariViewControllerDidFinish:(SFSafariViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
