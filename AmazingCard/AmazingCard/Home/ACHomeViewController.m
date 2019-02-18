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
@property (nonatomic, strong) UIImage *testImage;

@end

@implementation ACHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"A.C";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpSubView];
    [self loadData];

}

- (void)setUpSubView {
    _tableView = [[BaseTableView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = COLOR(234, 238, 248);
    [self.view addSubview:_tableView];
    
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                           target:self
                                                                                           action:@selector(rightBarButtonItemAction:)];
}

- (void)loadData {
    
}

- (void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarItem {
    ACEditViewController *editVC = [[ACEditViewController alloc] initWithType:ACEditViewControllerType_Circle];
    
    [self.navigationController pushViewController:editVC animated:YES];
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
            
        }];
    }
    cell.mainImage = self.testImage;

    return cell;
}
    
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return scaleForiPadAndBaseOn6p(207, 207);
}

#pragma mark - lazy
- (UIImage *)testImage {
    if (!_testImage) {
        _testImage = [UIImage imageNamed:@"amazingCard"];
    }
    return _testImage;
}

@end
