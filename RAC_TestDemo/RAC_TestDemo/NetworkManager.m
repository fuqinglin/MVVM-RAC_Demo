//
//  NetworkManager.m
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking.h>

@implementation NetworkManager

AFHTTPSessionManager *manager = nil;
+ (AFHTTPSessionManager *)manager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer  serializer];
        manager.requestSerializer.timeoutInterval = 10.0;
        manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        manager.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/JavaScript", @"text/json", @"text/html", nil];
    });
    return manager;
}


+ (void)GET:(NSString *)url parameters:(NSDictionary *)param success:(void(^)(id responseObject))success failure:(void(^)(NSError *_Nonnull error))failue {
    
    [[self manager] GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if(failue) {
            failue(error);
        }
    }];
}

@end
