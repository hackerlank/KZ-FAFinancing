//
//  FABaseRequestManager.m
//  FAFinancing
//
//  Created by HouKangzhu on 16/8/8.
//  Copyright © 2016年 侯康柱. All rights reserved.
//

#import "FARequestManager.h"
#import <AFNetWorking.h>
#import "FAErrorDescription.h"
//********************************************
@implementation FAResponse

- (NSString *)errorDescription {
    if (_infoCode == kHTTP_REQUEST_ERROR) {
        return @"https请求失败,详细信息看 error属性";
    }
    return [FAErrorDescription errorWithCode:_infoCode];
}

- (BOOL)isSuccess {
    return _infoCode == kREQUEST_SUCCESE_CODE;;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"{\n请求结果: %@\n状态码: %ld\n请求结果: %@\n错误信息: %@\n错误描述: %@\n}", self.isSuccess?@"成功":@"失败", (long)self.infoCode, [self.resalut description], self.error, self.errorDescription];
}

@end
//********************************************
@interface FAReachabilityChecker : NSObject

@property (nonatomic, weak) id taget;
@property (nonatomic, unsafe_unretained) SEL selector;

+ (instancetype)checkerWithTarget:(id)target selector:(SEL)selector;
@end

@implementation FAReachabilityChecker

+ (instancetype)checkerWithTarget:(id)target selector:(SEL)selector {
    FAReachabilityChecker *action = [[FAReachabilityChecker alloc] init];
    action.taget = target;
    action.selector = selector;
    return action;
}
@end

//********************************************
#pragma mark - 请求类 -
@interface FARequestManager () {
    dispatch_queue_t    _request_queue;
    NSMutableArray *_reachabilityTSArr;
}
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property (nonatomic, strong) AFSecurityPolicy *securityPolicy;
@end

@implementation FARequestManager
@synthesize currentNetStatus = _currentNetStatus;

single_implementation(FARequestManager)

- (instancetype)init {
    if (self = [super init]) {
        _request_queue = dispatch_queue_create("com.fafinancing.request", 0);
        
        _manager = [AFHTTPSessionManager manager];
        
        AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        responseSerializer.removesKeysWithNullValues = YES;
        responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json",@"text/json",@"text/text",nil];
        _manager.responseSerializer = responseSerializer;
        
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        _manager.requestSerializer.timeoutInterval = 60.f;
        
        ///https添加证书
//        _manager.securityPolicy = self.securityPolicy;
        
        dispatch_async(_request_queue, ^{
            [self startReachability];
        });
    }
    return self;
}

///https证书加载
- (AFSecurityPolicy *)securityPolicy {
    if (_securityPolicy != nil) {
        return _securityPolicy;
    }
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];//证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    _securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    _securityPolicy.allowInvalidCertificates = YES;
    _securityPolicy.validatesDomainName = NO;
    _securityPolicy.pinnedCertificates = [NSSet setWithObjects:certData, nil];
    return _securityPolicy;
}

- (void)basePostWithURLString:(NSString *)urlString
               parameters:(NSDictionary *)param
                 progress:(void(^)(NSProgress *))progress
                  success:(void(^)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject))success
                  failure:(void(^)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error))failure {
    dispatch_async(_request_queue, ^{
         [_manager POST:urlString parameters:param progress:progress success:success failure:failure];
    });
}

- (void)startReachability {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
       dispatch_async(_request_queue, ^{
           NSMutableArray *tempArr = nil;
           for (FAReachabilityChecker *chcker in _reachabilityTSArr) {
               if (chcker.taget == nil) {
                   if (tempArr == nil) {
                       tempArr = [NSMutableArray array];
                   }
                   [tempArr addObject:chcker];
               }
               else {
                   fa_asyn_mian_queue(^{
                       ((void(*)(id, SEL, int))objc_msgSend)(chcker.taget, chcker.selector, *(int*)&status);
                   });
               }
           }
           [_reachabilityTSArr removeObjectsInArray:tempArr];
       });
    }];
}

- (void)addNetWorkChangeWithTarget:(id)target selector:(SEL)selector {
    if (_reachabilityTSArr == nil) {
        _reachabilityTSArr = [NSMutableArray array];
    }
    FAReachabilityChecker *checker = [FAReachabilityChecker checkerWithTarget:target selector:selector];
    [_reachabilityTSArr addObject:checker];
}

- (FANetWorkStatus)currentNetStatus {
    _currentNetStatus = [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus;
    return _currentNetStatus;
}

+ (void)postWithURLString:(NSString *)urlString
               parameters:(NSDictionary *)param
                  reponse:(void(^)(FAResponse *response))reponseBlock {
    FARequestManager *requestManager = [FARequestManager sharedFARequestManager];
    FAResponse *response = [[FAResponse alloc] init];
    [requestManager basePostWithURLString:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (reponseBlock) {
            response.infoCode = [responseObject[@"JInfo"][@"infoCode"] integerValue];
            response.resalut = responseObject;
            reponseBlock(response);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (reponseBlock) {
            response.infoCode = kHTTP_REQUEST_ERROR;
            response.error = error;
            reponseBlock(response);
        }
    }];
}

+ (FAResponse *)syncPostWithURLString:(NSString *)urlString
                           parameters:(NSDictionary *)param {
    dispatch_semaphore_t semaphore_t = dispatch_semaphore_create(0);
    __block FAResponse *rep = nil;
    [self postWithURLString:urlString parameters:param reponse:^(FAResponse *response) {
        rep = response;
        dispatch_semaphore_signal(semaphore_t);
    }];
    dispatch_semaphore_wait(semaphore_t, DISPATCH_TIME_FOREVER);
    return rep;
}

@end
