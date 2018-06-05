//
//  HTTPManager.h
//  xtd
//
//  Created by leimo on 2017/8/10.
//  Copyright © 2017年 sj. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 网络请求成功的Block */
typedef void(^requestSuccess)(HYBaseNetworkModel *baseNetworkModel);
/** 网络请求失败的Block */
typedef void(^requestFailure)(NSError *error);
//网络请求完成的model
typedef void(^ComplectionBlock)(HYBaseNetworkModel *networkModel);


@interface HTTPManager : NSObject

/** 单例HTTPManager */
+ (instancetype )shareHTTPManager;

/*!
 @method
 @brief                 封装get请求
 @param url             get请求的URL
 @param para            get请求的参数
 @param complectionBlock     回调
 */
- (void)getDataFromUrl:(NSString *)url
         withParameter:(NSDictionary *)para
           complection:(ComplectionBlock)complectionBlock;

/*!
 @method
 @brief        封装POST请求
 @param url    请求的URL
 @param para   请求的参数
 @param complectionBlock    回调
 */
- (void)postDataFromUrl:(NSString *)url
         withParameter:(NSDictionary *)para
            complection:(ComplectionBlock)complectionBlock;




@end
