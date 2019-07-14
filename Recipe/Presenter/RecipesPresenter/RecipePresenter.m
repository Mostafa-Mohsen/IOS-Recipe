//
//  RecipePresenter.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "RecipePresenter.h"

@implementation RecipePresenter

-(instancetype) initWithRecipeView :(id<IRecipeView>) recipeView{
    self = [super init];
    if (self) {
        _recipeView = recipeView;
    }
    return self;
}

-(void) defineRecipePresenter{
    [_recipeView showLoading];
    RecipeService *service = [RecipeService sharedInstance];
    service.recipePresenter = self;
}

-(void) getRecipes :(NSString*)searchText{
    [_recipeView showLoading];
    RecipeService *service = [RecipeService sharedInstance];
    [service getRecipesData:[NSString stringWithFormat:@"https://api.edamam.com/search?q=%@&app_id=9b3da956&app_key=5e85e075822a1368b9efafa387a149eb&from=0&to=20",searchText]];
     
//     @"https://api.edamam.com/search?q=chicken&app_id=9b3da956&app_key=5e85e075822a1368b9efafa387a149eb&from=0&to=20"];
   
//    [contactService getConatct:self];
}

-(void) onSuccess : (NSMutableArray*) recipes{
    [_recipeView hideLoading];
    [_recipeView renderRecipesWithObjects:recipes];
}
-(void) onFail : (NSString*) errorMessage{
    
}

@end
