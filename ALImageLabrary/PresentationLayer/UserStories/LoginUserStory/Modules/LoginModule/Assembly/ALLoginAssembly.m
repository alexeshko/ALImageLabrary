//
//  ALLoginAssembly.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALLoginAssembly.h"

#import "ALLoginViewController.h"
#import "ALLoginInteractor.h"
#import "ALLoginPresenter.h"
#import "ALLoginRouter.h"

@implementation ALLoginAssembly

+ (UIViewController *)createModuleWithoutConfiguration {
    ALLoginViewController *view = [[ALLoginViewController alloc] init];
    ALLoginInteractor *interactor = [[ALLoginInteractor alloc] init];
    ALLoginPresenter *presenter = [[ALLoginPresenter alloc] init];
    ALLoginRouter *router = [[ALLoginRouter alloc] init];

    view.output = presenter;

    presenter.view = view;
    presenter.router = router;
    presenter.interactor = interactor;

    router.transitionHandler = view;

    return view;
}

@end
