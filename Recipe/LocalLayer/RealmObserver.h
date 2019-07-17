//
//  RealmObserver.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol RealmObserver <NSObject>

-(void) handleSuccessWithRealm : (NSString*) serviceName  : (NSArray*) searchHistory;

@end

