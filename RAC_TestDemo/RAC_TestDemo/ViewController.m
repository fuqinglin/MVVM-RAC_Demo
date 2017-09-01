//
//  ViewController.m
//  RAC_TestDemo
//
//  Created by Kinglin on 2017/8/30.
//  Copyright © 2017年 CardLan. All rights reserved.
//

#import "ViewController.h"
#import "MovieCell.h"
#import "ViewModel.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) ViewModel *viewModel;
@property (nonatomic, strong) NSArray *moviesData;
@end

static  NSString *cellID = @"MovieCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:cellID bundle:nil] forCellReuseIdentifier:cellID];
    [self executeCommand];
    
}

- (ViewModel *)viewModel {
    if (!_viewModel) {
        
        _viewModel = [[ViewModel alloc] init];
    }
    return _viewModel;
}

- (void)executeCommand {
    
    @weakify(self)
    [[self.viewModel.command execute:nil] subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.moviesData = [NSArray arrayWithArray:x];
        [self observe];
        [self.tableView reloadData];
    }];
}

- (void)observe {
    @weakify(self)
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
        @strongify(self)
        NSLog(@" === %@", x);
        
        if (x.length > 0) {
            self.moviesData = [self.viewModel queryMoviesWithName:x];
        } else if(x.length == 0) {
            self.moviesData = [NSArray arrayWithArray:self.viewModel.dataSources];
        }
        [self.tableView reloadData];

    }];
}


#pragma mark - <UITableViewDataSource, UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.moviesData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.viewModel = self.moviesData[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
