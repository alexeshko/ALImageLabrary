//
//  ALMainDetailPresenter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALMainDetailModuleInput.h"
#import "ALMainDetailViewOutput.h"

@protocol ALMainDetailViewInput;
@protocol ALMainDetailRouterInput;
@protocol ALMainDetailInteractorInput;

@protocol ALMainDetailModuleOutput;

@interface ALMainDetailPresenter : NSObject <ALMainDetailModuleInput, ALMainDetailViewOutput>

@property (nonatomic, strong) id<ALMainDetailInteractorInput> interactor;
@property (nonatomic, strong) id<ALMainDetailRouterInput> router;
@property (nonatomic, weak) id<ALMainDetailViewInput> view;

@property (nonatomic, weak) id<ALMainDetailModuleOutput> moduleOutput;

@end
