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


@protocol IRecipeView <NSObject,IBaseView>

-(void) renderRecipesWithObjects : (NSMutableArray*) recipes;

@end

@protocol IRecipePresenter <NSObject>

-(void) getRecipes :(NSString*)searchText;
-(void) onSuccess : (NSMutableArray*) recipes;
-(void) onFail : (NSString*) errorMessage;
-(void) defineRecipePresenter;

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

@protocol IRecipeManager <NSObject>

-(void) getRecipesData:(NSString*) dataURL;
-(void) getSuggestions:(id<ISearchPresenter>) searchPresenter;
-(void) searchBarSearchButtonClicked:(NSString*) searchText;

@end
