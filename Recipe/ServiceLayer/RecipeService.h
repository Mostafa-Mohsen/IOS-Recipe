//
//  RecipeService.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkObserver.h"
#import "ServiceProtocol.h"
#import "RecipeContract.h"
#import "NetworkManager.h"
#import "Recipe.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecipeService : NSObject <NetworkObserver, ServiceProtocol , IRecipeManager>

@property id<IRecipePresenter> recipePresenter;
@property NSMutableArray<Recipe*> *recipes;

@end

NS_ASSUME_NONNULL_END
