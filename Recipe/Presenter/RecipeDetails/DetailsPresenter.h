//
//  DetailsPresenter.h
//  Recipe
//
//  Created by Mostafa on 7/14/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecipeContract.h"
#import "RecipeService.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsPresenter : NSObject <IDetailsPresenter>

@property id<IDetailsView> detailsView;

-(instancetype) initWithDetailsView :(id<IDetailsView>) detailsView;

@end

NS_ASSUME_NONNULL_END
