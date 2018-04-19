//
//  ALMainDetailAssembly.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "ALMainDetailAssembly.h"

#import "ALMainDetailViewController.h"
#import "ALMainDetailInteractor.h"
#import "ALMainDetailPresenter.h"
#import "ALMainDetailRouter.h"

@implementation ALMainDetailAssembly

+ (UIViewController *)createModuleWithConfiguration:(void(^)(id<ALMainDetailModuleInput> input))configuration {
    ALMainDetailViewController *view = [[ALMainDetailViewController alloc] init];
    ALMainDetailInteractor *interactor = [[ALMainDetailInteractor alloc] init];
    ALMainDetailPresenter *presenter = [[ALMainDetailPresenter alloc] init];
    ALMainDetailRouter *router = [[ALMainDetailRouter alloc] init];

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
