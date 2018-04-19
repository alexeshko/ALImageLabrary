//
//  ALMainDetailModuleInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 19/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALMainDetailModuleOutput;

@protocol ALMainDetailModuleInput <NSObject>

@property (nonatomic, weak) id<ALMainDetailModuleOutput> moduleOutput;

@end
