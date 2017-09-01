//
//  CellViewModel.m
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/31.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import "CellViewModel.h"
#import "Model.h"

@implementation CellViewModel

- (instancetype)initWithModel:(id)model
{
    self = [super init];
    if (self) {
        [self updateValuesFromModel:model];
    }
    return self;
}

- (void)updateValuesFromModel:(id)model {
    
    Model *_model = (Model *)model;
    
    self.title = _model.title;
    self.release_date = _model.release_date;
    self.score = _model.score;
    self.cover_url = _model.cover_url;
}

@end
