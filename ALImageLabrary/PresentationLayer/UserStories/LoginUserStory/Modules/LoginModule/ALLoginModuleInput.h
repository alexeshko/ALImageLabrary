//
//  ALLoginModuleInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 05/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALLoginModuleOutput;

@protocol ALLoginModuleInput <NSObject>

@property (nonatomic, weak) id<ALLoginModuleOutput> moduleOutput;

@end
