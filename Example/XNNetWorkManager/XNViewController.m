//
//  XNViewController.m
//  XNNetWorkManager
//
//  Created by Luigi on 06/27/2019.
//  Copyright (c) 2019 Luigi. All rights reserved.
//

#import "XNViewController.h"
#import "XNHTTPManage.h"
#import "AFNetworking.h"

@interface XNViewController ()

@end

@implementation XNViewController

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

- (IBAction)defaultHttpRequest:(id)sender {
    [XNHTTPManage Post:@"" parameters:nil hudAnimation:YES success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"----- responseObject = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----- error = %@",error);
    }];
    
    
}

- (IBAction)allConfigHttpRequest:(id)sender {
    
    NSString *url = @"http://www.baidu.com";
    NSDictionary *parameters = @{@"pageNo":@"1",@"pageSize":@"10"};
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary <NSString *,NSString *> *headers = @{@"key1":@"value1",@"key2":@"value2"};
    
    
    [XNHTTPManage Post:url parameters:parameters hudAnimation:YES requestSerializer:serializer securityPolicy:[AFSecurityPolicy defaultPolicy] headers:headers duplicateParameters:parameters duplicateType:DuplicateType_CancelCurrentRequest  success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"----- responseObject = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----- error = %@",error);
    }];
}

- (IBAction)uploadImageDataRequest:(id)sender {

    [XNHTTPManage Get:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=wx6789a5fb8a7eb060&secret=572319307bb4f96be7c7890bafc7e3c9&code=081QY41a2W17aN0wqg0a2Hid1a2QY41V&grant_type=authorization_code"
           parameters:nil hudAnimation:YES success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
               
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
               
           }];
    
}


@end
