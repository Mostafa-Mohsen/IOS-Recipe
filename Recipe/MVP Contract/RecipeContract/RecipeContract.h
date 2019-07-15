//
//  RecipeContract.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseContract.h"
#import "SearchHistory.h"
#import "Recipe.h"


@protocol IRecipeView <NSObject,IBaseView>

-(void) renderRecipesWithObjects : (NSMutableArray*) recipes;
-(void) updateSearchBar:(NSString*)search;

@end

@protocol IRecipePresenter <NSObject>

-(void) getRecipes;
-(void) onSuccess : (NSMutableArray*) recipes more:(Boolean) more;
-(void) onFail : (NSString*) errorMessage;
-(void) defineRecipePresenter;
-(void) setRecipe:(Recipe*)recipe;
-(void) resetStates :(NSString*)search;

@end

@protocol ISearchView <NSObject>

- (void)updateData:(NSArray*)suggestions;

@end

@protocol ISearchPresenter <NSObject>

- (void)getSuggestions;
- (void)searchBarSearchButtonClicked:(NSString*) searchText;
- (void)searchBarTextDidChange:(NSString *)searchText;
-(void) onSuccess : (NSArray<SearchHistory*>*) searchHistory;
-(void) onFail : (NSString*) errorMessage;

@end

@protocol IDetailsView <NSObject>

-(void) showData:(Recipe*)recipe;

@end

@protocol IDetailsPresenter <NSObject>

-(void) getRecipe;

@end

@protocol IRecipeManager <NSObject>

-(void) getRecipesData:(NSString*) dataURL;
-(void) getSuggestions:(id<ISearchPresenter>) searchPresenter;
-(void) searchBarSearchButtonClicked:(NSString*) searchText;

@end
