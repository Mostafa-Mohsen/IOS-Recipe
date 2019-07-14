//
//  SearchPresenter.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "SearchPresenter.h"

@implementation SearchPresenter{
    NSMutableArray *allSuggestions;
    NSArray *filterSuggestions;
}

-(instancetype) initWithRecipeView :(id<ISearchView>) searchView{
    self = [super init];
    if (self) {
        _searchView = searchView;
    }
    return self;
}

- (void)getSuggestions{
    allSuggestions = [NSMutableArray new];
    filterSuggestions = [NSArray new];
    RecipeService *service = [RecipeService sharedInstance];
    [service getSuggestions:self];
}


- (void)searchBarSearchButtonClicked:(NSString*) searchText{
    RecipeService *service = [RecipeService sharedInstance];
    [service searchBarSearchButtonClicked:searchText];
}

- (void)searchBarTextDidChange:(NSString *)searchText{
    if([searchText isEqualToString:@""]){
        [_searchView updateData:allSuggestions];
    }else{
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@",searchText];
        filterSuggestions = [allSuggestions filteredArrayUsingPredicate:predicate];
        [_searchView updateData:filterSuggestions];
    }
}

-(void) onSuccess : (NSArray<SearchHistory*>*) searchHistory{
    for (int i = 0 ; i < searchHistory.count ; i++){
        [allSuggestions addObject:searchHistory[i].searchText];
    }
    [_searchView updateData:allSuggestions];
}

-(void) onFail : (NSString*) errorMessage{
    
}

@end
