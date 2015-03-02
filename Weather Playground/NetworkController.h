//
//  NetworkController.h
//  Weather Playground
//
//  Created by Jake Herrmann on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface NetworkController : NSObject

+ (AFHTTPSessionManager *)api;

@end
