//
//  ALMainRouterInput.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 18/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ALMainTableItem;

@protocol ALMainRouterInput <NSObject>

- (void)openMainDetailModuleWithItem:(ALMainTableItem *)item;

@end
