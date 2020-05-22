//
//  OverrideViewController.m
//  YQDarkModeDemo
//
//  Created by vivian on 2020/5/22.
//  Copyright © 2020 vivian. All rights reserved.
//

#import "OverrideViewController.h"

@interface OverrideViewController() {
    UILabel *noteLabel;
}

@end

@implementation OverrideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    noteLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    noteLabel.text = @"OverrideViewController 跟随手机进行暗黑适配";
    noteLabel.font = [UIFont systemFontOfSize:20.0];
    noteLabel.numberOfLines = 0;
    [self.view addSubview:noteLabel];
    // 保持原彩模式
    self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
}

#pragma mark - 监听系统模式变化

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
   //创建动态 color
    UIColor *color = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor darkGrayColor];
        } else {
            return [UIColor whiteColor];
        }
    }];
    self.view.backgroundColor = color;
    // 修改label的textcolor
    UIColor *textColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor whiteColor];
        } else {
            return [UIColor blackColor];
        }
    }];
    noteLabel.textColor = textColor;
}

@end
