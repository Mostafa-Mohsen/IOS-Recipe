//
//  RecipePresenter.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecipeContract.h"
#import "RecipeService.h"

@interface RecipePresenter : NSObject <IRecipePresenter>

@property
id<IRecipeView> recipeView;

-(instancetype) initWithRecipeView :(id<IRecipeView>) recipeView;

@end


