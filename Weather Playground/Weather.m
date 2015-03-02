//
//  Weather.m
//  Weather Playground
//
//  Created by Jake Herrmann on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Weather.h"

@implementation Weather

static NSString * const locationKey = @"location";
static NSString * const mainKey = @"main";
static NSString * const descriptionKey = @"description";
static NSString * const tempKey = @"temp";
static NSString * const iconKey = @"icon";


-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.locationName = dictionary[@"name"];
        self.weatherMain = dictionary[@"weather"][0][@"main"];
        self.weatherDescription = dictionary[@"weather"][0][@"description"];
        //self.weatherTemp = dictionary[@"main"][@"temp"];
        //self.weatherIcon = dictionary[@"weather"][0][@"icon"];
        
        NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://openweathermap.org/img/w/%@.png", dictionary[@"weather"][0][@"icon"]]];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        self.weatherIcon = [UIImage imageWithData:imageData];
        
        NSNumberFormatter *f = [NSNumberFormatter new];
        f.numberStyle = NSNumberFormatterDecimalStyle;
        NSString *string = dictionary[@"main"][@"temp"];
        NSNumber *tempNumber = [NSNumber numberWithDouble:[string doubleValue]]; //[f numberFromString:string];
        double fahrenheit = ([tempNumber doubleValue] - 273.15) * 1.8000 + 32;
        self.weatherTemp = [NSString stringWithFormat:@"%.1f",fahrenheit];
        
                           
    }
    return self;
}

@end


