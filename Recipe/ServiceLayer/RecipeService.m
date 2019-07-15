//
//  RecipeService.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "RecipeService.h"

@implementation RecipeService

+(RecipeService*)sharedInstance{
    static RecipeService *service = nil;
    static dispatch_once_t dispatchPredicate;
    dispatch_once(&dispatchPredicate, ^{
        service = [[RecipeService alloc] init];
    });
    return service;
}

-(void) getRecipesData:(NSString*) dataURL{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        bool isThere = [[AFNetworkReachabilityManager sharedManager] isReachable];
        if(isThere){
            [NetworkManager connectGetToURL:dataURL serviceName:@"RecipeService" serviceProtocol:self];
        }else{
            [self handleFailWithErrorMessage:@"couldn't load data because your iphone isn't connected to the internet" :@"RecipeService"];
        }
    }];
}

-(void)handleSuccessWithJSONData:(id)jsonData :(NSString *)serviceName{
    
    
    if ([serviceName isEqualToString:@"RecipeService"]) {
        
        NSDictionary *dict = (NSDictionary*)jsonData;
        Boolean more = (Boolean)[dict objectForKey:@"more"];
        self.recipes = [NSMutableArray new];
        NSArray *recipesArray = [dict objectForKey:@"hits"];
        for(int i = 0 ; i < recipesArray.count ; i++){
            NSDictionary *dict2 = recipesArray[i];
            NSDictionary *dict3 = [dict2 objectForKey:@"recipe"];
            Recipe *recipe = [Recipe new];
            recipe.label = [dict3 objectForKey:@"label"];
            recipe.image = [dict3 objectForKey:@"image"];
            recipe.source = [dict3 objectForKey:@"source"];
            recipe.healthLabels = [[dict3 objectForKey:@"healthLabels"] componentsJoinedByString:@" ,"];
            recipe.url = [dict3 objectForKey:@"url"];
            recipe.ingredientLines = [dict3 objectForKey:@"ingredientLines"];
            [self.recipes addObject:recipe];
        }
        [_recipePresenter onSuccess:self.recipes more:more];
    }
    
    
}


-(void) handleFailWithErrorMessage : (NSString*) errorMessage : (NSString*) serviceName{
    
    if ([serviceName isEqualToString:@"RecipeService"]) {
        NSLog(@"%@",errorMessage);
        [_recipePresenter onFail:errorMessage];
    }
    
}

-(void) getSuggestions:(id<ISearchPresenter>) searchPresenter{
    _searchPresenter = searchPresenter;
    [RealmManager readFromRealm:@"RecipeService" serviceProtocol:self];
}

-(void) searchBarSearchButtonClicked:(NSString*) searchText{
    [RealmManager saveToRealm:searchText];
    [_recipePresenter resetStates:searchText];
    [_recipePresenter getRecipes];
}

-(void) handleSuccessWithRealm : (NSString*) serviceName  : (NSArray*) searchHistory{
    if ([serviceName isEqualToString:@"RecipeService"]) {
        [_searchPresenter onSuccess:searchHistory];
    }
}

-(void) handleRealmFailWithErrorMessage : (NSString*) serviceName : (NSString*) errorMessage{
    if ([serviceName isEqualToString:@"RecipeService"]) {
        [_searchPresenter onFail:errorMessage];
    }
}


@end
