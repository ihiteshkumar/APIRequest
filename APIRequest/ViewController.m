//
//  ViewController.m
//  APIRequest
//
//  Created by Hitesh Kumar on 03/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate>

@property NSString *location;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.location  = @"2172797&APPID=25b733dc88e97fd111c34250afbeac1c";

    [self DataGetByURL];
    
    [self GetDataByRequest];
}

-(void)DataGetByURL {
    NSURLSession * session = [NSURLSession sharedSession];
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?id=%@", self.location];

    NSURL * url = [NSURL URLWithString: urlString];
    
    
    // Asynchronously Api is hit here
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url
                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                               {
                                                   
                                                   NSLog(@"Data \n%@",data);
                                                   
                                                   NSDictionary * json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                   NSLog(@"Json \n %@",json);
        //                                           success(json);
                                                   
                                                   
                                                   
                                               }];
    
    [dataTask resume] ; // Executed First
    

}
-(void)GetDataByRequest {
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?id=%@", self.location];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                                {
                                                    NSLog(@"Data \n%@",data);
                                                    
                                                    NSDictionary * json  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    NSLog(@"Json \n %@",json);
                                                }];
    [dataTask resume];

}


-(void)ForPostData {
    NSError *error;
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];

//    NSString *urlString = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?id=%@", self.location];

    NSURL *url = [NSURL URLWithString:@"[JSON SERVER"];
//    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    NSDictionary *mapData = [[NSDictionary alloc] initWithObjectsAndKeys: @"TEST IOS", @"name",
                             @"IOS TYPE", @"typemap",
                             nil];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
    }];
    
    [postDataTask resume];
}


@end
