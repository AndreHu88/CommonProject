//
//  HYAlertView.h
//  Booking
//
//  Created by Duntech on 2018/4/23.
//  Copyright © 2018年 Duntech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYAlertView : UIView

typedef void(^AlertResult)(NSInteger index);

@property (nonatomic,copy) AlertResult resultIndex;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message sureBtn:(NSString *)sureTitle cancleBtn:(NSString *)cancleTitle;

- (void)showAlertView;

@end
