//
//  HTTPManager.m
//  xtd
//
//  Created by leimo on 2017/8/10.
//  Copyright © 2017年 sj. All rights reserved.
//

#import "HTTPManager.h"

typedef NS_ENUM(NSUInteger, RequestType) {
    RequestTypeGet,
    RequestTypePost,
};

@implementation HTTPManager

static AFHTTPSessionManager *manager;

+ (instancetype)shareHTTPManager{

    static HTTPManager *httpManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        httpManager = [HTTPManager new];
        manager = [AFHTTPSessionManager manager];
    });
    return httpManager;
}

- (void)getDataFromUrl:(NSString *)url withParameter:(NSDictionary *)para complection:(ComplectionBlock)complectionBlock{
    
    [self requestUrl:url requestType:RequestTypeGet parameter:para complectionBlock:complectionBlock];
}

- (void)postDataFromUrl:(NSString *)url withParameter:(NSDictionary *)para complection:(ComplectionBlock)complectionBlock{
    
    [self requestUrl:url requestType:RequestTypePost parameter:para complectionBlock:complectionBlock];
}

- (void)requestUrl:(NSString *)url requestType:(RequestType)type parameter:(NSDictionary *)para complectionBlock:(ComplectionBlock)complectionBlock{
    
    //先判断当前的网络状态
    if (manager.reachabilityManager.networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        
        //构造error model返回
        HYBaseNetworkModel *errorModel = [HYBaseNetworkModel new];
        errorModel.error = [NSError errorWithDomain:NSCocoaErrorDomain code:RequestErrorTypeNetWork userInfo:nil];
        errorModel.message = @"网络无法连接";
        complectionBlock(errorModel);
        return;
    }
    
    NSString *urlString= [NSString stringWithFormat:@"%@/%@",API_DomainStr,url];
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/plain", @"text/html", nil];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.securityPolicy.allowInvalidCertificates = YES;
    
    if (type == RequestTypeGet) {
        
        [manager GET:urlString parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            HYBaseNetworkModel *responseModel = [HYBaseNetworkModel new];
            if (!KObjIsEmpty(responseObject)) {
                
                [responseModel modelSetWithDictionary:responseObject];
            }
            else{
                
                responseModel.error = [NSError errorWithDomain:NSCocoaErrorDomain code:RequestErrorTypeResonse userInfo:nil];
            }
            
            if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *HTTPURLResponse = (NSHTTPURLResponse *)task.response;
                responseModel.headers = HTTPURLResponse.allHeaderFields.mutableCopy;
            }
            complectionBlock(responseModel);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [JRToast showWithText:@"server error" duration:2];
            [JRToast showWithText:@"server error" duration:2];
            HYBaseNetworkModel *responseModel = [HYBaseNetworkModel new];
            responseModel.error = [NSError errorWithDomain:NSCocoaErrorDomain code:RequestErrorTypeServer userInfo:nil];
            responseModel.message = @"server error";
            complectionBlock(responseModel);
        }];
    }
    else{
        
        [manager POST:urlString parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            HYBaseNetworkModel *responseModel = [HYBaseNetworkModel new];
            if (!KObjIsEmpty(responseObject)) {
                
                [responseModel modelSetWithDictionary:responseObject];
            }
            else{
                
                responseModel.error = [NSError errorWithDomain:NSCocoaErrorDomain code:RequestErrorTypeResonse userInfo:nil];
            }
            
            if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSHTTPURLResponse *HTTPURLResponse = (NSHTTPURLResponse *)task.response;
                responseModel.headers = HTTPURLResponse.allHeaderFields.mutableCopy;
            }
            complectionBlock(responseModel);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [JRToast showWithText:@"server error" duration:2];
            HYBaseNetworkModel *responseModel = [HYBaseNetworkModel new];
            responseModel.error = [NSError errorWithDomain:NSCocoaErrorDomain code:RequestErrorTypeServer userInfo:nil];
            responseModel.message = @"server error";
            complectionBlock(responseModel);
        }];
    }
    
    
}



@end
