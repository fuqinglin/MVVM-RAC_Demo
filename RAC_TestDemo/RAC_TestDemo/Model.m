//
//  Model.m
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import "Model.h"

@implementation Model


- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@, %@, %@, %@",_title, _release_date, _score,_cover_url];
}

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

@end
