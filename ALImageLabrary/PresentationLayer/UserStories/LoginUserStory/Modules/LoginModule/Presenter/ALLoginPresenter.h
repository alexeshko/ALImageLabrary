//
//  ALLoginPresenter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALLoginViewOutput.h"

@protocol ALLoginViewInput;
@protocol ALLoginRouterInput;
@protocol ALLoginInteractorInput;

@interface ALLoginPresenter : NSObject <ALLoginViewOutput>

@property (nonatomic, strong) id<ALLoginInteractorInput> interactor;
@property (nonatomic, strong) id<ALLoginRouterInput> router;
@property (nonatomic, weak) id<ALLoginViewInput> view;

@end
