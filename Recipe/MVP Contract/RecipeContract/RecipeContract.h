//
//  RecipeContract.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseContract.h"


@protocol IRecipeView <NSObject,IBaseView>

-(void) renderRecipesWithObjects : (NSMutableArray*) recipes;

@end

@protocol IRecipePresenter <NSObject>

-(void) getRecipes :(NSString*)searchText;
-(void) onSuccess : (NSMutableArray*) recipes;
-(void) onFail : (NSString*) errorMessage;

@end

@protocol IRecipeManager <NSObject>

-(void) getRecipe :(id<IRecipePresenter>) recipePresenter dataUrl:(NSString*) dataURL;

@end



