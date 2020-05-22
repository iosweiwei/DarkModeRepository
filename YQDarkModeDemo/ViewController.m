//
//  ViewController.m
//  YQDarkModeDemo
//
//  Created by vivian on 2020/5/22.
//  Copyright © 2020 vivian. All rights reserved.
//

#import "ViewController.h"
#import "OverrideViewController.h"

@interface ViewController () {
    UIImageView *imageView;
    UILabel *label;
    CALayer *layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"1.png"];
    [self.view addSubview:imageView];
    layer = [CALayer layer];
    layer.frame = CGRectMake(100, 200, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    label = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 200, 200)];
    label.text = @"ViewController 跟随手机进行暗黑适配";
    label.font = [UIFont systemFontOfSize:20.0];
    label.numberOfLines = 0;
    [self.view addSubview:label];
}

#pragma mark - 点击触发

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    OverrideViewController *overrideViewController = [OverrideViewController new];
    [self.navigationController pushViewController:overrideViewController animated:YES];
}

#pragma mark - 监听系统模式变化

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    NSLog(@"traitCollectionDidChange");
    // 创建动态 bgColor
    UIColor *bgColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor blackColor];
        } else {
            return [UIColor whiteColor];
        }
    }];
    self.view.backgroundColor = bgColor;
    // 创建动态 layerColor
    UIColor *layerColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if (traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
            return [UIColor whiteColor];
        } else {
            return [UIColor darkGrayColor];
        }
    }];
    
    // 改变layer 颜色
    // 1.方法一
    // UIColor *resolveColor = [layerColor resolvedColorWithTraitCollection:self.traitCollection];
    // layer.backgroundColor = resolveColor.CGColor;
    // 2.方法二
    layer.backgroundColor = layerColor.CGColor;
    // 修改label的textcolor
    label.textColor = layerColor;
}

@end
