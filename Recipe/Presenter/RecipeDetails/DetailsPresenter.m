//
//  DetailsPresenter.m
//  Recipe
//
//  Created by Mostafa on 7/14/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "DetailsPresenter.h"

@implementation DetailsPresenter

-(instancetype) initWithDetailsView :(id<IDetailsView>) detailsView{
    self = [super init];
    if (self) {
        _detailsView = detailsView;
    }
    return self;
}

-(void) getRecipe{
    RecipeService* service = [RecipeService sharedInstance];
    [_detailsView showData:service.recipe];
}

@end
