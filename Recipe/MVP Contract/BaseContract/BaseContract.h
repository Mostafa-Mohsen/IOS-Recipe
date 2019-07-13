//
//  BaseContract.h
//  Recipe
//
//  Created by Mostafa on 7/13/19.
//  Copyright © 2019 M-M_M. All rights reserved.
//

#import <Foundation/Foundation.h>



@protocol IBaseView <NSObject>

-(void) showLoading;
-(void) hideLoading;
-(void) showErrorMessage : (NSString*) errorMessage;

@end


