//
//  CellViewModel.h
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/31.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellViewModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *cover_url;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *release_date;


- (instancetype)initWithModel:(id)model;

@end
