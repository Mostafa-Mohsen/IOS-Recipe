//
//  RealmManager.m
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import "RealmManager.h"

@implementation RealmManager

static id<RealmObserver> RealmObserverDelegate;
static NSString* classServiceName;

+(void) saveToRealm : (NSString*) searchText{

    RLMRealm *realm = [RLMRealm defaultRealm];
    
    RLMResults *results = [SearchHistory objectsWhere:[NSString stringWithFormat:@"searchText == '%@'",searchText]];
    RLMResults *results2 = [[SearchHistory allObjects] sortedResultsUsingKeyPath:@"date" ascending:NO];
    [realm beginWriteTransaction];
    if(results.count > 0){
        [[results firstObject] setValue:[NSDate date] forKeyPath:@"date"];
    }else if(results2.count < 10){
        SearchHistory *searchSuggestion = [SearchHistory new];
        searchSuggestion.searchText = searchText;
        searchSuggestion.date = [NSDate date];
        [realm addObject:searchSuggestion];
    }else{
        [[results2 lastObject] setValue:searchText forKeyPath:@"searchText"];
        [[results2 lastObject] setValue:[NSDate date] forKeyPath:@"date"];
    }
    [realm commitWriteTransaction];
}


+(void) readFromRealm : (NSString*) serviceName serviceProtocol : (id<RealmServiceProtocol>) serviceProtocol{
    classServiceName = serviceName;
    RealmObserverDelegate = (id<RealmObserver>)serviceProtocol;
    RLMResults *results = [[SearchHistory allObjects] sortedResultsUsingKeyPath:@"date" ascending:NO];
    if(results.count > 0){
        [RealmObserverDelegate handleSuccessWithRealm:classServiceName :(NSArray*)results];
    }
}

@end
