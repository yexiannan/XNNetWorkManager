//
//  XNHTTPManage.m
//  XNNetWorkManager
//
//  Created by Luigi on 2019/6/27.
//  Copyright © 2019 Luigi. All rights reserved.
//

#import "XNHTTPManage.h"
#import "XNHTTPSessionManager.h"

@implementation XNHTTPManage

#pragma mark - 基础请求
/**
 * 基础POST请求
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    //设置超时时间
    [serializer willChangeValueForKey:@"timeoutInterval"];
    serializer.timeoutInterval = 20.f;
    [serializer didChangeValueForKey:@"timeoutInterval"];
    
    
    return [self Post:URLString
           parameters:parameters
    requestSerializer:serializer
       securityPolicy:[AFSecurityPolicy defaultPolicy]
              headers:nil
              success:success
              failure:failure];
}

/**
 * 基础GET请求
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                   parameters:(nullable id)parameters
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    
    AFHTTPRequestSerializer *serializer = [AFHTTPRequestSerializer serializer];
    //设置超时时间
    [serializer willChangeValueForKey:@"timeoutInterval"];
    serializer.timeoutInterval = 20.f;
    [serializer didChangeValueForKey:@"timeoutInterval"];
    
    return [self Get:URLString
           parameters:parameters
    requestSerializer:serializer
       securityPolicy:[AFSecurityPolicy defaultPolicy]
              headers:nil
             success:success
              failure:failure];
}

#pragma mark - 配置AFHTTPSessionManager
/**
 * Post配置requestSerializer Post: parameters: requestSerializer: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
             requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    return [self Post:URLString
           parameters:parameters
    requestSerializer:requestSerializer
       securityPolicy:[AFSecurityPolicy defaultPolicy]
              headers:headers
              success:success
              failure:failure];
}
/**
 * Post配置securityPolicy Post: parameters: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
                securityPolicy:(AFSecurityPolicy *)securityPolicy
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    return [self Post:URLString
           parameters:parameters
    requestSerializer:[AFHTTPRequestSerializer serializer]
       securityPolicy:securityPolicy
              headers:headers
              success:success
              failure:failure];
}
/**
 * Post配置requestSerializer和securityPolicy Post: parameters: requestSerializer: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
             requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                securityPolicy:(AFSecurityPolicy *)securityPolicy
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    
    AFHTTPSessionManager *manager = [XNHTTPSessionManager sharedHttpPostSessionManager];
    manager.requestSerializer = requestSerializer;
    manager.securityPolicy = securityPolicy;
    
    return [self httpMethod:HttpMethod_Post
                  URLString:URLString
                 parameters:parameters
                    headers:headers
                    manager:manager
                   progress:nil
                    success:success
                    failure:failure];
}


/**
 * Get配置requestSerializer Get: parameters: requestSerializer: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                   parameters:(nullable id)parameters
            requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
                      headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    return [self Get:URLString
           parameters:parameters
    requestSerializer:requestSerializer
       securityPolicy:[AFSecurityPolicy defaultPolicy]
              headers:headers
              success:success
              failure:failure];
}
/**
 * Get配置securityPolicy Get: parameters: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                   parameters:(nullable id)parameters
               securityPolicy:(AFSecurityPolicy *)securityPolicy
                      headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    return [self Get:URLString
          parameters:parameters
   requestSerializer:[AFHTTPRequestSerializer serializer]
      securityPolicy:securityPolicy
             headers:headers
             success:success
             failure:failure];
}
/**
 * Get配置requestSerializer和securityPolicy Get: parameters: requestSerializer: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                   parameters:(nullable id)parameters
            requestSerializer:(AFHTTPRequestSerializer *)requestSerializer
               securityPolicy:(AFSecurityPolicy *)securityPolicy
                      headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                      success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure{
    
    AFHTTPSessionManager *manager = [XNHTTPSessionManager sharedHttpPostSessionManager];
    manager.requestSerializer = requestSerializer;
    manager.securityPolicy = securityPolicy;
    
    return [self httpMethod:HttpMethod_Get
                  URLString:URLString
                 parameters:parameters
                    headers:headers
                    manager:manager
                   progress:nil
                    success:success
                    failure:failure];
}
#pragma mark - 根据httpMethod发送请求
/**
 * 根据配置的参数调用 AFHTTPSessionManager 发送请求
 */
+ (NSURLSessionDataTask *)httpMethod:(HttpMethod)httpMethod
                           URLString:(NSString *)URLString
                          parameters:(nullable id)parameters
                             headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                             manager:(AFHTTPSessionManager *)manager
                            progress:(void (^)(NSProgress * _Nonnull))progress
                             success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                             failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
    
    for (NSString *headerField in headers.keyEnumerator) {
        [manager.requestSerializer setValue:headers[headerField] forHTTPHeaderField:headerField];
    }
    
    if (httpMethod == HttpMethod_Post) {
        
        return [manager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progress) {
                progress(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(task,error);
            }
        }];
        
    } else if (httpMethod == HttpMethod_Get) {
        
        return [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
            if (progress) {
                progress(downloadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task,responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(task,error);
            }
        }];
        
    } else {
        NSAssert(NO, @"目前只支持POST、GET请求");
        return nil;
    }
    
}

#pragma mark - 上传图片
/**
 *  上传单张图片
 */
+ (NSURLSessionDataTask *)POST:(NSString *)urlString
                     imageData:(NSData *)imageData
                          name:(NSString *)name
                    parameters:(nullable id)parameters
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
             requestSerializer:(nullable AFHTTPRequestSerializer *)requestSerializer
                      progerss:(nullable void(^)(NSProgress *uploadProgress))progress
                       success:(nullable void(^)(NSURLSessionTask *task,id _Nullable responseObject))success
                       failure:(nullable void(^)(NSURLSessionTask *_Nullable task,NSError *error))failure{
    return [self POST:urlString
       imageDataArray:@[imageData]
                 name:name
           parameters:parameters
              headers:headers
    requestSerializer:requestSerializer
             progerss:progress
              success:success
              failure:failure];
}

/**
 *  上传多张图片
 */
+ (NSURLSessionDataTask *)POST:(NSString *)urlString
                imageDataArray:(NSArray <NSData *> *)imageDataArray
                          name:(NSString *)name
                    parameters:(nullable id)parameters
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
             requestSerializer:(nullable AFHTTPRequestSerializer *)requestSerializer
                      progerss:(nullable void(^)(NSProgress *uploadProgress))progress
                       success:(nullable void(^)(NSURLSessionTask *task,id _Nullable responseObject))success
                       failure:(nullable void(^)(NSURLSessionTask *_Nullable task,NSError *error))failure{
    
    AFHTTPSessionManager *manager = [XNHTTPSessionManager sharedHttpPostSessionManager];
    if (requestSerializer) {
        manager.requestSerializer = requestSerializer;
    } else {
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    }
    
    for (NSString *headerField in headers.keyEnumerator) {
        [manager.requestSerializer setValue:headers[headerField] forHTTPHeaderField:headerField];
    }
    
    
    return [manager POST:urlString
              parameters:parameters
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    [imageDataArray enumerateObjectsUsingBlock:^(NSData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj) {
            //enumerateObjectsUsingBlock方式添加自动释放池中，一次上传结束即释放临时变量，处理内存峰值及优化内存使用
            [formData appendPartWithFileData:obj name:name fileName:@"image.jpeg" mimeType:@"image/jpeg"];
        }
    }];
}
                progress:^(NSProgress * _Nonnull uploadProgress) {
                    //上传进度
                    if (progress) {
                        progress(uploadProgress);
                    }
                    
                }
                 success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     if (responseObject) {
                         success(task, responseObject);
                     }
                 }
                 failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     if (failure) {
                         failure(task, error);
                     }
                 }];
}

@end
