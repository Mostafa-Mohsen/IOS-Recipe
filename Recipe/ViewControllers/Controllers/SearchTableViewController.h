//
//  SearchTableViewController.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchPresenter.h"
#import "RecipeContract.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchTableViewController : UITableViewController <ISearchView,UISearchBarDelegate,UISearchResultsUpdating>

@property UISearchBar *searchBar;
@property NSArray *suggestions;

@property SearchPresenter *searchPresenter;

@end

NS_ASSUME_NONNULL_END
