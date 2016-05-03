//
//  ViewController.m
//  APIRequest
//
//  Created by Hitesh Kumar on 03/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property NSString *location;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.location  = @"2172797&APPID=25b733dc88e97fd111c34250afbeac1c";
    [self showLocaiton];
    
}

-(void)showLocaiton {
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?id=%@", self.location];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSData *data = [NSURLConnection sendSynchronousRequest:urlRequest
                                         returningResponse:nil
                                                     error:nil];
    if (data != nil) {
        NSDictionary *weatherDict = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingMutableContainers
                                                                      error:nil];
       NSLog(@"%@", [weatherDict description]);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
