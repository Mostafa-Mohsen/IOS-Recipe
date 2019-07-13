//
//  RecipeService.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "RecipeService.h"

@implementation RecipeService


-(void) getRecipe :(id<IRecipePresenter>) recipePresenter dataUrl:(NSString*) dataURL {
    
    _recipePresenter = recipePresenter;
    
    [NetworkManager connectGetToURL:dataURL serviceName:@"RecipeService" serviceProtocol:self];
}

-(void)handleSuccessWithJSONData:(id)jsonData :(NSString *)serviceName{
    
    
    if ([serviceName isEqualToString:@"RecipeService"]) {
        
        NSDictionary *dict = (NSDictionary*)jsonData;
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
            recipe.uri = [dict3 objectForKey:@"uri"];
            recipe.ingredientLines = [dict3 objectForKey:@"ingredientLines"];
            [self.recipes addObject:recipe];
            NSLog(@"%@",self.recipes[i].label);
        }
        

        [_recipePresenter onSuccess:self.recipes];
    }
    
    
}


-(void) handleFailWithErrorMessage : (NSString*) errorMessage : (NSString*) serviceName{
    
    if ([serviceName isEqualToString:@"RecipeService"]) {
        NSLog(@"%@",errorMessage);
        [_recipePresenter onFail:errorMessage];
    }
    
}


@end
