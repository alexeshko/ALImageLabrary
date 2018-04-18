//
//  ALMainModuleInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ALMainModuleOutput;

@protocol ALMainModuleInput <NSObject>

@property (nonatomic, weak) id<ALMainModuleOutput> moduleOutput;

- (void)configureWithCurrentIP:(NSString *)currentIP;

@end
