//
//  HYBaseNetworkModel.h
//  Booking
//
//  Created by Duntech on 2018/4/18.
//  Copyright © 2018年 Duntech. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestErrorType) {
    
    RequestErrorTypeNetWork = -1000,      //网络问题
    RequestErrorTypeServer,             //服务器问题
    RequestErrorTypeResonse,            //返回responsew问题
};

@interface HYBaseNetworkModel : NSObject

@property (nonatomic,strong) id result;
@property (nonatomic,copy)   NSString *message;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,strong) NSError *error;
@property (nonatomic,strong) NSMutableDictionary *headers;

@end
