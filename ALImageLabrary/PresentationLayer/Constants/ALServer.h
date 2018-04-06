//
//  ALServer.h
//  ALImageLabrary
//
//  Created by Alexey Leshko on 06/04/2018.
//  Copyright © 2018 HomeSolutions. All rights reserved.
//

#ifndef ALServer_h
#define ALServer_h

/**
 Base URL
 */

static NSString * const ALServerBaseURL = @"https://jsonplaceholder.typicode.com";

/**
 Path patterns
 */

static NSString * const ALServerPathPattern = @"/json/";

/**
 Server response code
 */

static NSString * const ALServerCode200OK = @"200";
static NSString * const ALServerCode201Created = @"201";
static NSString * const ALServerCode400Bad = @"400";
static NSString * const ALServerCodeError = @"UnresolvedError";

/**
 Service indicates location by IP
 */

static NSString * const ALServerServiceURLForIPApi = @"http://ip-api.com";
static NSString * const ALServerServiceURLForIPVigilante = @"https://ipvigilante.com";

#endif /* ALServer_h */
