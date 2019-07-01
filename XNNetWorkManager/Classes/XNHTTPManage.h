//
//  XNHTTPManage.h
//  XNNetWorkManager
//
//  Created by Luigi on 2019/6/27.
//  Copyright © 2019 Luigi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HttpMethod) {
    HttpMethod_Post,
    HttpMethod_Get,
};

//@class AFHTTPRequestSerializer;
//@class AFSecurityPolicy;
//@class AFHTTPSessionManager;

@interface XNHTTPManage : NSObject

/**
 *  @param urlString 网络URL
 *  @param parameters 参数
 *  @param requestSerializer 默认AFHTTPRequestSerializer 可自定义缓存类型，超时等配置，默认超时时间20s
 *  @param securityPolicy 默认defaultPolicy
 *  @param headers 请求头配置
 *  @param progress 上传、下载进度
 *  @param success 成功block
 *  @param failure 失败block
 */

#pragma mark - 基础请求
/**
 * 基础POST请求
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

/**
 * 基础GET请求
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                    parameters:(nullable id)parameters
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;

#pragma mark - 配置AFHTTPSessionManager
/**
 * Post配置requestSerializer Post: parameters: requestSerializer: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
             requestSerializer:(id)requestSerializer
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;
/**
 * Post配置securityPolicy Post: parameters: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
                securityPolicy:(id)securityPolicy
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;
/**
 * Post配置requestSerializer和securityPolicy Post: parameters: requestSerializer: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Post:(NSString *)URLString
                    parameters:(nullable id)parameters
             requestSerializer:(id)requestSerializer
                securityPolicy:(id)securityPolicy
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;


/**
 * Get配置requestSerializer Get: parameters: requestSerializer: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                    parameters:(nullable id)parameters
             requestSerializer:(id)requestSerializer
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;
/**
 * Get配置securityPolicy Get: parameters: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                    parameters:(nullable id)parameters
                securityPolicy:(id)securityPolicy
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;
/**
 * Get配置requestSerializer和securityPolicy Get: parameters: requestSerializer: securityPolicy: headers: progress: success: failure:
 */
+ (NSURLSessionDataTask *)Get:(NSString *)URLString
                    parameters:(nullable id)parameters
             requestSerializer:(id)requestSerializer
                securityPolicy:(id)securityPolicy
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure;
#pragma mark - 根据httpMethod发送请求
/**
 * 直接调用AFNetWorking httpMethod: URLString: parameters: headers: manager: progress: success: failure:
 */
+ (nullable NSURLSessionDataTask *)httpMethod:(HttpMethod)httpMethod
                                    URLString:(NSString *)URLString
                                   parameters:(nullable id)parameters
                                      headers:(nullable NSDictionary <NSString *, NSString *> *)headers
                                      manager:(id)manager
                                     progress:(nullable void(^)(NSProgress *uploadProgress))progress
                                      success:(nullable void(^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure;

#pragma mark - 上传图片
/**
 *  上传单张图片
 */
+ (NSURLSessionDataTask *)POST:(NSString *)urlString
                     imageData:(NSData *)imageData
                          name:(NSString *)name
                    parameters:(nullable id)parameters
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
             requestSerializer:(nullable id)requestSerializer
                      progerss:(nullable void(^)(NSProgress *uploadProgress))progress
                       success:(nullable void(^)(NSURLSessionTask *task,id _Nullable responseObject))success
                       failure:(nullable void(^)(NSURLSessionTask *_Nullable task,NSError *error))failure;

/**
 *  上传多张图片
 */
+ (NSURLSessionDataTask *)POST:(NSString *)urlString
                imageDataArray:(NSArray <NSData *> *)imageDataArray
                          name:(NSString *)name
                    parameters:(nullable id)parameters
                       headers:(nullable NSDictionary <NSString *, NSString *> *)headers
             requestSerializer:(nullable id)requestSerializer
                      progerss:(nullable void(^)(NSProgress *uploadProgress))progress
                       success:(nullable void(^)(NSURLSessionTask *task,id _Nullable responseObject))success
                       failure:(nullable void(^)(NSURLSessionTask *_Nullable task,NSError *error))failure;

@end

NS_ASSUME_NONNULL_END
