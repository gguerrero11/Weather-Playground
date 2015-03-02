//
//  WeatherController.m
//  Weather Playground
//
//  Created by Jake Herrmann on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WeatherController.h"
#import "NetworkController.h"
#import "Weather.h"
#import "AFNetworking.h"


static NSString * const locationKey = @"location";
static NSString * const mainKey = @"main";
static NSString * const descriptionKey = @"description";
static NSString * const tempKey = @"temp";


@implementation WeatherController

+ (WeatherController*)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [WeatherController new];
    });
    
    return sharedInstance;
}

- (void)fetchWeatherWithName:(NSString *)name completion:(void (^)(Weather *weather))completion {
    
    NSString *path = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?q=%@", name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *responseWeatherDictionary = responseObject;
        
        Weather *weather = [[Weather alloc] initWithDictionary:responseWeatherDictionary];
        completion(weather);
    }
     failure:^(NSURLSessionDataTask *task, NSError *error) {
         NSLog(@"error getting countries: %@", error);
         completion(nil);
     }];
    
}




@end
