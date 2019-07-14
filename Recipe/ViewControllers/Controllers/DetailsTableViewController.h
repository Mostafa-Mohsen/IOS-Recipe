//
//  DetailsTableViewController.h
//  Recipe
//
//  Created by Mostafa on 7/14/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SafariServices/SafariServices.h>
#import "Recipe.h"
#import "RecipeContract.h"
#import "DetailsPresenter.h"
#import "DetailsImgTableViewCell.h"
#import "DetailsTitleTableViewCell.h"
#import "DetailsIngredientsTableViewCell.h"
#import "DetailsSingleIngTableViewCell.h"
#import "DetailsLinkTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsTableViewController : UITableViewController <IDetailsView,SFSafariViewControllerDelegate>

@property Recipe* recipe;
@property DetailsPresenter *detailsPresenter;

@end

NS_ASSUME_NONNULL_END
