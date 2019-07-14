//
//  SearchPresenter.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecipeContract.h"
#import "RecipeService.h"
#import "SearchHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchPresenter : NSObject <ISearchPresenter>

@property id<ISearchView> searchView;

-(instancetype) initWithRecipeView :(id<ISearchView>) searchView;

@end

NS_ASSUME_NONNULL_END
