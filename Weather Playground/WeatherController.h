//
//  WeatherController.h
//  Weather Playground
//
//  Created by Jake Herrmann on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Weather;

@interface WeatherController : NSObject

+ (WeatherController*)sharedInstance;

- (void)fetchWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion;

@end
