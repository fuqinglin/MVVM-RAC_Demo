//
//  NetworkManager.h
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject


+ (void)GET:(NSString *_Nullable)url parameters:(NSDictionary *_Nullable)param success:(void(^_Nullable)(id _Nullable responseObject))success failure:(void(^_Nullable)(NSError *_Nonnull error))failue;

@end
