//
//  Recipe.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Recipe : NSObject

@property NSString *label;
@property NSString *image;
@property NSString *source;
@property NSString *healthLabels;
@property NSString *uri;
@property NSArray<NSString*> *ingredientLines;

@end

