//
//  HYBaseNetworkModel.m
//  Booking
//
//  Created by Duntech on 2018/4/18.
//  Copyright © 2018年 Duntech. All rights reserved.
//

#import "HYBaseNetworkModel.h"

@implementation HYBaseNetworkModel

- (NSString *)description{
    
    return [NSString stringWithFormat:@"statusCode:%ld\nerror:%@\nresponseResult:%@",self.status,self.error,self.result];
}

- (void)setError:(NSError *)error{
    
    _error = error;
    self.status = error.code;
    self.message = error.localizedDescription;
}

@end
