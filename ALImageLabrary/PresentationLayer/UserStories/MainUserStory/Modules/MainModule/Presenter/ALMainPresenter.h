//
//  ALMainPresenter.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ALMainModuleInput.h"
#import "ALMainViewOutput.h"

@protocol ALMainViewInput;
@protocol ALMainRouterInput;
@protocol ALMainInteractorInput;

@protocol ALMainModuleOutput;

@interface ALMainPresenter : NSObject <ALMainModuleInput, ALMainViewOutput>

@property (nonatomic, strong) id<ALMainInteractorInput> interactor;
@property (nonatomic, strong) id<ALMainRouterInput> router;
@property (nonatomic, weak) id<ALMainViewInput> view;

@property (nonatomic, weak) id<ALMainModuleOutput> moduleOutput;

@end
