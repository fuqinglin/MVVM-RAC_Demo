//
//  Model.h
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

/*
 title:
 cover_url:
 score:
 release_date:
 
 */

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *cover_url;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *release_date;

- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
