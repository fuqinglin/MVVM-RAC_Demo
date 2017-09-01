//
//  ViewModel.h
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@interface ViewModel : NSObject

@property (nonatomic, strong) RACCommand *command;
@property (nonatomic, strong) NSArray *dataSources;

- (NSArray *)queryMoviesWithName:(NSString *)name;

@end
