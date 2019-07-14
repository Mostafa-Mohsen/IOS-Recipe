//
//  RealmManager.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm.h>
#import "RealmServiceProtocol.h"
#import "RealmObserver.h"
#import "SearchHistory.h"

NS_ASSUME_NONNULL_BEGIN

@interface RealmManager : NSObject

+(void) saveToRealm : (NSString*) searchText;
+(void) readFromRealm : (NSString*) serviceName serviceProtocol : (id<RealmServiceProtocol>) serviceProtocol;

@end

NS_ASSUME_NONNULL_END
