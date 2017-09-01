//
//  MovieCell.m
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import "MovieCell.h"
#import "CellViewModel.h"
#import "ReactiveObjC.h"
#import <UIImageView+AFNetworking.h>

@interface MovieCell ()
@property (weak, nonatomic) IBOutlet UIImageView *movieImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieRatingLabel;
@end

@implementation MovieCell


- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self updateUI];
}

- (void)updateUI {
    
    @weakify(self)
    [RACObserve(self, viewModel) subscribeNext:^(CellViewModel *viewModel) {
       @strongify(self)
        
        self.movieTitleLabel.text = viewModel.title;
        self.movieDateLabel.text = viewModel.release_date;
        self.movieRatingLabel.text = viewModel.score;
        [self.movieImageView setImageWithURL:[NSURL URLWithString:viewModel.cover_url]];
    }];
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
