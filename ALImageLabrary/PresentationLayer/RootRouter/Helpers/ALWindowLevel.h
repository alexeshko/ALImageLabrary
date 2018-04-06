//
//  ALWindowLevel.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#ifndef ALWindowLevel_h
#define ALWindowLevel_h

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ALWindowType) {
    ALWindowTypeMain = 1,
    ALWindowTypeMenu,
    ALWindowTypeAlert,
};

static inline UIWindowLevel ALWindowLevelAtType(ALWindowType type) {
    return UIWindowLevelNormal + type;
}

#endif /* ALWindowLevel_h */
