//
//  ACHomeViewController.m
//  AmazingCard
//
//  Created by 杨琦 on 2018/12/5.
//  Copyright © 2018 AmazingCard. All rights reserved.
//

#import "ACHomeViewController.h"
#import "BaseTableView.h"
#import "Masonry.h"
#import "ACHomeVCTableViewCell.h"
#import "ACEditViewController.h"

@interface ACHomeViewController ()<UITableViewDelegate, UITableViewDataSource>
    
@property (nonatomic, strong) BaseTableView *tableView;

@end

@implementation ACHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"A.C";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [[BaseTableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = COLOR(234, 238, 248);
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ACHomeVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ACHomeVCTableViewCell"];
    if (!cell) {
        cell = [[ACHomeVCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ACHomeVCTableViewCell"];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setContainterTapAction:^{
            ACEditViewController *editVC = [[ACEditViewController alloc] init];
            [self.navigationController pushViewController:editVC animated:YES];
        }];
    }
    
    return cell;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return scaleForiPadAndBaseOn6p(207, 207);
}

@end
