//
//  XNViewController.m
//  XNNetWorkManager
//
//  Created by Luigi on 06/27/2019.
//  Copyright (c) 2019 Luigi. All rights reserved.
//

#import "XNViewController.h"
#import "XNHTTPManage.h"

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
    [XNHTTPManage Post:@"" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"----- responseObject = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----- error = %@",error);
    }];
}

- (IBAction)allConfigHttpRequest:(id)sender {
    
    NSString *url = @"http://finance.lianlianche.com:8109/carLoan/listApply";
    NSDictionary *parameters = @{@"pageNo":@"1",@"pageSize":@"10",@"departmentId":@"4o4a527/QhytS64sA62Zbw"};
    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary <NSString *,NSString *> *headers = @{@"X-uid":@"Jdej4fzCS/yZX3Uru3T1+Q",@"X-token":@"SYS-USER-TOKEN:20000:7057e90c9b4b67522f27d2edff98959982d0c2edf594013b:9729362a5d0023896edde4051d63f4cd0b086327ff7348c1"};
    
    [XNHTTPManage Post:url parameters:parameters requestSerializer:serializer securityPolicy:[AFSecurityPolicy defaultPolicy] headers:headers success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"----- responseObject = %@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----- error = %@",error);
    }];
}

- (IBAction)uploadImageDataRequest:(id)sender {
    [XNHTTPManage POST:@"" imageData:[NSData data] name:@"images" parameters:nil headers:@{@"key1":@"value1",@"key2":@"value2"} requestSerializer:[AFHTTPRequestSerializer serializer] progerss:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"----- uploadProgress = %@",uploadProgress);
        UIButton *button = sender;
        [button setTitle:uploadProgress.localizedDescription forState:UIControlStateNormal];
    } success:^(NSURLSessionTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"----- responseObject = %@",responseObject);
    } failure:^(NSURLSessionTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----- error = %@",error);
    }];
}


@end
