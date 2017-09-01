//
//  ViewModel.m
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import "ViewModel.h"
#import "NetworkManager.h"
#import "Model.h"
#import "CellViewModel.h"

@implementation ViewModel

// https://movie.douban.com/j/chart/top_list?type=5&interval_id=100%3A90&action=&start=0&limit=20


- (RACCommand *)command {
    
    @weakify(self)
    _command =  [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
       
       return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
           @strongify(self)
           
           NSString *url = @"https://movie.douban.com/j/chart/top_list?type=5&interval_id=100%3A90&action=&start=0&limit=20";
           [NetworkManager GET:url parameters:nil success:^(id  _Nullable responseObject) {
               
               if ([responseObject isKindOfClass:[NSArray class]]) {
                   
                   NSArray *objects = responseObject;
                   NSMutableArray *viewmodels = [NSMutableArray array];
                   [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                      
                       if (![obj isKindOfClass:[NSDictionary class]]) {
                           return;
                       }
                       // 这个model感觉有些鸡肋了，因为viewModel中已经有model中的相关属性了
                       Model *model = [[Model alloc] initWithDictionary:obj];
                       CellViewModel *viewModel = [[CellViewModel alloc] initWithModel:model];
                       [viewmodels addObject:viewModel];
                   }];
                   
                   self.dataSources = [NSArray arrayWithArray:viewmodels];
                   [subscriber sendNext:_dataSources];
                   [subscriber sendCompleted];
               }
               
           } failure:^(NSError * _Nonnull error) {
               [subscriber sendCompleted];
               NSLog(@"%@",error);
           }];
           
           return nil;
            
        }];
    }];
    return _command;
}

- (NSArray *)queryMoviesWithName:(NSString *)name {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:[NSString stringWithFormat:@"title CONTAINS '%@'",name]];
    return [self.dataSources filteredArrayUsingPredicate:predicate];
}



@end
