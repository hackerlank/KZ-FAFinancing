//
//  FABaseRequestManager.h
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSInteger kHTTP_REQUEST_ERROR = 10000;
static const NSInteger kREQUEST_SUCCESE_CODE = 888;

typedef NS_ENUM(NSUInteger, FANetWorkStatus) {
    FANetWorkStatusUnKnown  = -1,   //不知道啥网
    FANetWorkStatusNon      = 0,    //没网
    FANetWorkStatusWWAN     = 1,    //流量
    FANetWorkStatusWIFI     = 2,    //wifi
};

//***************************** 华丽的分割线 ************************************
/*!
 *  请求结果的包装
 */
@interface FAResponse : NSObject
/// 请求结果 成功时为成功结果(NSDictionary),失败时为为NSError
@property (nonatomic, strong           ) id resalut;
/// 请求是否成功
@property (nonatomic, unsafe_unretained, readonly) BOOL         isSuccess;
/// 返回状态码
@property (nonatomic, unsafe_unretained) NSInteger    infoCode;
/// 请求错误信息 成功时为空
@property (nonatomic, strong           ) id           error;
/// 错误描述    成功时为空
@property (nonatomic, strong,readonly  ) NSString     *errorDescription;

@end

//***************************** 华丽的分割线 ************************************

@interface FARequestManager : NSObject
single_interface(FARequestManager)

///当前的网络状态
@property (nonatomic, unsafe_unretained, readonly) FANetWorkStatus currentNetStatus;

/*!
 *  添加一个网络状态的监听
 *  selector的写法
 *      - (void)netChangeAction:(FANetWorkStatus)status {
 *          //TODO: -
 *      }
 *  @param target   监听者
 *  @param selector 回调方法
 */
- (void)addNetWorkChangeWithTarget:(id)target selector:(SEL)selector;

/*!
 *  异步请求
 *
 *  @param urlString    请求地址
 *  @param param        参数
 *  @param reponseBlock 请求结果,具体描述见上面定义
 */
+ (void)postWithURLString:(NSString *)urlString
               parameters:(NSDictionary *)param
                  reponse:(void(^)(FAResponse *response))reponseBlock;

/*!
 *  同步请求
 *
 *  @param urlString 请求地址
 *  @param param     参数
 *
 *  @return 返回结果, 具体描述见上面定义
 */
+ (FAResponse *)syncPostWithURLString:(NSString *)urlString
                           parameters:(NSDictionary *)param;
@end
