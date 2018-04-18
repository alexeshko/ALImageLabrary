//
//  ALMainAssembly.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainAssembly.h"

#import "ALMainViewController.h"
#import "ALMainInteractor.h"
#import "ALMainPresenter.h"
#import "ALMainRouter.h"

@implementation ALMainAssembly

+ (UIViewController *)createModuleWithConfiguration:(void(^)(id<ALMainModuleInput> input))configuration {
    ALMainViewController *view = [[ALMainViewController alloc] init];
    ALMainInteractor *interactor = [[ALMainInteractor alloc] init];
    ALMainPresenter *presenter = [[ALMainPresenter alloc] init];
    ALMainRouter *router = [[ALMainRouter alloc] init];

    view.output = presenter;

    presenter.view = view;
    presenter.router = router;
    presenter.interactor = interactor;

    router.transitionHandler = view;

    if (configuration) {
        configuration(presenter);
    }

    return view;
}

@end
