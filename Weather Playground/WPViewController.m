//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WeatherController.h"
#import "Weather.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@end

@implementation WPViewController
- (IBAction)search:(id)sender {
    NSString *name = [self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[WeatherController sharedInstance]fetchWeatherWithName:name completion:^(Weather *weather) {
        
        NSString *locationName = [NSString stringWithFormat:@"Location: %@",weather.locationName];
        
        NSString *weatherMain = [NSString stringWithFormat:@"%@", weather.weatherMain];
        
        NSString *description = [NSString stringWithFormat:@"%@", weather.weatherDescription];
        
        NSString *weatherTemp = [NSString stringWithFormat:@"%@", weather.weatherTemp];
        
        self.locationLabel.text = locationName;
        self.mainLabel.text = weatherMain;
        self.descriptionLabel.text = description;
        self.tempLabel.text = weatherTemp;
        self.icon.image = weather.weatherIcon;
        
        
    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
