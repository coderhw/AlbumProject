//
//  HHChangeIconViewController.m
//  PhotoSecurity
//
//  Created by Evan on 2019/8/1.
//  Copyright © 2019 xiaopin. All rights reserved.
//

#import "HHChangeIconViewController.h"
#import "HHChangeIconCell.h"

@interface HHChangeIconViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger selectRow;
@end

@implementation HHChangeIconViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"Change APP ICON", nil);
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, APP_WIDH,
                                                                   APP_HIGH-Height_NavBar)
                                                  style:UITableViewStylePlain];
    [self.tableView registerNib:[UINib nibWithNibName:@"HHChangeIconCell" bundle:nil] forCellReuseIdentifier:@"HHChangeIconCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, APP_WIDH, 14)];
    tipLabel.text = NSLocalizedString(@"Select You icon you like", nil);
    tipLabel.textColor = [UIColor colorWithHex:@"#999999"];
    tipLabel.font = kFONT(kTitleName_PingFang_M, 14);
    tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tableView.tableFooterView = tipLabel;
}

#pragma mark - UITableView Delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HHChangeIconCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HHChangeIconCell"];
    [cell configCellWithRow:indexPath.row selectRow:self.selectRow];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsMake(0, 46, 0, 0)];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *imageName = nil;
    switch (indexPath.row) {
        case 0:
        {
            imageName = @"IconRainbow";
        }
            break;
        case 1:
        {
            imageName = @"IconDrama";
        }
            break;
        case 2:
        {
            imageName = @"IconPre";
        }
            break;
        case 3:
        {
            imageName = nil;
        }
        default:
            break;
    }
    [[UIApplication sharedApplication] setAlternateIconName:imageName
                                          completionHandler:^(NSError * _Nullable error) {
                                              if(!error){
                                                  [self.navigationController popViewControllerAnimated:YES];
                                              }
                                              NSLog(@"error = %@", error.localizedDescription);
                                              
    }];
}




@end
