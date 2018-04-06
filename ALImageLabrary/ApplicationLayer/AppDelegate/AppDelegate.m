//
//  AppDelegate.m
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05.04.18.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import "AppDelegate.h"

#import "ALLoginAssembly.h"

#import "ALServerFactory.h"
#import "ALConnectionService.h"
#import "ALLocationService.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

#pragma mark ‐ Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeRootViewController];
    [self initializeConfigurationOfRestKit];
    [self initializeNetworkMonitoring];
    [self initializeLocationService];
    
    return YES;
}

#pragma mark - Private Methods

- (void)initializeRootViewController {
    UIViewController *loginController = [ALLoginAssembly createModuleWithoutConfiguration];
    UINavigationController *mainNavigation = [[UINavigationController alloc] initWithRootViewController:loginController];
    mainNavigation.navigationBar.translucent = NO;
    [mainNavigation.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [mainNavigation.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.rootViewController = mainNavigation;
    [_window makeKeyAndVisible];
}

- (void)initializeConfigurationOfRestKit {
    [ALServerFactory sharedFactory];
}

- (void)initializeNetworkMonitoring {
    [[ALConnectionService sharedService] startMonitoringNetwork];
}

- (void)initializeLocationService {
    [[ALLocationService sharedService] getUserLocationByIP];
}

@end
