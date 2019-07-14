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
#import "RealmServiceProtocol.h"
#import "RealmManager.h"
#import "RealmObserver.h"

NS_ASSUME_NONNULL_BEGIN

@interface RecipeService : NSObject <NetworkObserver, ServiceProtocol, RealmObserver, RealmServiceProtocol, IRecipeManager>

@property id<IRecipePresenter> recipePresenter;
@property id<ISearchPresenter> searchPresenter;
@property NSMutableArray<Recipe*> *recipes;
@property Recipe* recipe;

+(RecipeService*)sharedInstance;

@end

NS_ASSUME_NONNULL_END
