//
//  SearchHistory.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RLMObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchHistory : RLMObject

@property NSString* searchText;
@property NSDate* date;

@end

NS_ASSUME_NONNULL_END
