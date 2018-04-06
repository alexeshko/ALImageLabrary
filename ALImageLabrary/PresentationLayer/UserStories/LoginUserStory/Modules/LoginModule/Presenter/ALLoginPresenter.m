//
//  ALLoginPresenter.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLoginPresenter.h"

#import "ALLoginViewInput.h"
#import "ALLoginRouterInput.h"
#import "ALLoginInteractorInput.h"

#import "ALLocationService.h"

@interface ALLoginPresenter () {
    NSString *_currentIP;
}

@end

@implementation ALLoginPresenter

#pragma mark - ALLoginModuleInput



#pragma mark - ALLoginViewOutput

- (void)viewDidLoad {
    [self.view setupInitialState];
}

- (void)didTouchJoinButton {
    if ([self.interactor checkUserForJoin]) {
        [self.router openMainModuleWithCurrentIP:_currentIP];
    }
}

- (void)didTakeCurrentIP:(NSString *)currentIP {
    _currentIP = currentIP;
}

#pragma mark - Private Methods



@end
