//
//  RecipesViewController.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <DGActivityIndicatorView.h>
#import "RecipeContract.h"
#import "RecipePresenter.h"
#import "RecipeTableViewCell.h"
#import "Recipe.h"
#import "SearchTableViewController.h"
#import "DetailsTableViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface RecipesViewController : UIViewController <IRecipeView,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *searchControllerContainer;
@property (weak, nonatomic) IBOutlet UITableView *recipesTable;
@property (weak, nonatomic) IBOutlet UILabel *notesText;

@property UISearchController *searchController;

@property NSMutableArray<Recipe*> *recipes;
@property RecipePresenter *recipePresenter;

@end

NS_ASSUME_NONNULL_END
