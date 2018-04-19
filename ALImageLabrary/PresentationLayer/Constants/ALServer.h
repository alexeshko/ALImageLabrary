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

static NSString * const ALServerBaseURL = @"https://api.imgur.com/";

/**
 Authorization
 */

static NSString * const ALServerAuthorization = @"Authorization";
static NSString * const ALServerAuthorizationClientID = @"Client-ID e254a73ec4dd21e";

/**
 Path patterns
 */

static NSString * const ALServerGalleryPath = @"3/gallery/";
static NSString * const ALServerHotViralPath = @"hot/viral/";
static NSString * const ALServerCommentsBestPath = @"/comments/best/";
static NSString * const ALServerLocationPath = @"/json/";

/**
 Server status
 */

static NSString * const ALServerStatus = @"status";

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
