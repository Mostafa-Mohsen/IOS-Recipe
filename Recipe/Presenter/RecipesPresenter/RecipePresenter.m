//
//  RecipePresenter.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "RecipePresenter.h"

@implementation RecipePresenter{
    Boolean more;
    int page;
    NSString *searchText;
}

-(instancetype) initWithRecipeView :(id<IRecipeView>) recipeView{
    self = [super init];
    if (self) {
        _recipeView = recipeView;
        searchText = [NSString new];
    }
    return self;
}

-(void) defineRecipePresenter{
    RecipeService *service = [RecipeService sharedInstance];
    service.recipePresenter = self;
}

-(void) getRecipes{
    if(more && page < 6){
        if(page == 1){
            [_recipeView showLoading];
        }
        RecipeService *service = [RecipeService sharedInstance];
        NSString *link = [NSString stringWithFormat:@"https://api.edamam.com/search?q=%@&app_id=9b3da956&app_key=5e85e075822a1368b9efafa387a149eb&from=%d&to=%d",searchText,(page*20-20),(page*20)];
        [service getRecipesData:link];
        page++;
    }
}

-(void) resetStates:(NSString*)search{
    page = 1;
    more = YES;
    [_recipeView updateSearchBar:search];
    NSString *searchNoSpace = [search stringByReplacingOccurrencesOfString:@" " withString:@""];
    searchText = searchNoSpace;
}

-(void) onSuccess : (NSMutableArray*) recipes more:(Boolean) more{
    more = more;
    if(page == 2){
        [_recipeView hideLoading];
    }
    if(recipes.count == 0 && page == 2){
        [_recipeView showErrorMessage:@"Your search didn't match any recipes"];
    }else{
        [_recipeView renderRecipesWithObjects:recipes];
    }
}
-(void) onFail : (NSString*) errorMessage{
    if([errorMessage isEqualToString:@"couldn't load data because your iphone isn't connected to the internet"]){
        [_recipeView showAlertNoInternet];
    }
    [_recipeView showErrorMessage:errorMessage];
}

-(void) setRecipe:(Recipe*)recipe{
    RecipeService *service = [RecipeService sharedInstance];
    service.recipe = recipe;
    [_recipeView goToDetails];
}

@end
