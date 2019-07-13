//
//  NetworkObserver.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkObserver <NSObject>

-(void) handleSuccessWithJSONData : (id) jsonData : (NSString*) serviceName;
-(void) handleFailWithErrorMessage : (NSString*) errorMessage : (NSString*) serviceName;

@end


