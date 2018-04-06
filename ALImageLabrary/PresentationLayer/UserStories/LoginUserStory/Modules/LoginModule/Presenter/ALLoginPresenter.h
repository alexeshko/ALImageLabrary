//
//  ALLoginPresenter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALLoginModuleInput.h"
#import "ALLoginViewOutput.h"

@protocol ALLoginViewInput;
@protocol ALLoginRouterInput;
@protocol ALLoginInteractorInput;

@protocol ALLoginModuleOutput;

@interface ALLoginPresenter : NSObject <ALLoginModuleInput, ALLoginViewOutput>

@property (nonatomic, strong) id<ALLoginInteractorInput> interactor;
@property (nonatomic, strong) id<ALLoginRouterInput> router;
@property (nonatomic, weak) id<ALLoginViewInput> view;

@property (nonatomic, weak) id<ALLoginModuleOutput> moduleOutput;

@end
