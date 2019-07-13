//
//  RecipeTableViewCell.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecipeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *recipeImg;
@property (weak, nonatomic) IBOutlet UILabel *recipeName;
@property (weak, nonatomic) IBOutlet UILabel *recipeSource;
@property (weak, nonatomic) IBOutlet UILabel *recipeHealth;

@end

NS_ASSUME_NONNULL_END
