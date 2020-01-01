//
//  ViewController.m
//  weibo
//
//  Created by admin on 2018/7/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Extension.h"
#import "PraiseView.h"
#import "PraiseView.h"

@interface ViewController ()
@property (nonatomic,strong)UIButton *praiseBtn;
@property (nonatomic,strong)PraiseView *prasieView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.praiseBtn];
    [self.view addSubview:self.prasieView];
    self.prasieView.chooseImageBlock = ^(YYAnimatedImageView *imageView){
       //选中的点赞效果
    };
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.praiseBtn.frame = CGRectMake(100, 100, 100, 100);
    self.prasieView.frame = CGRectMake(100, 100,200,40);
}
- (PraiseView *)prasieView {
    if (!_prasieView) {
        _prasieView = [[PraiseView alloc]init];
        _prasieView.backgroundColor = [UIColor whiteColor];
        _prasieView.center = self.praiseBtn.center;
        _prasieView.layer.cornerRadius = 20;
        _prasieView.clipsToBounds = YES;
        _prasieView.alpha = 0;
    }
    return _prasieView;
}
- (UIButton *)praiseBtn {
    
    if (!_praiseBtn) {
        _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_praiseBtn setTitle:@"赞" forState:UIControlStateNormal];
        [_praiseBtn addTarget:self action:@selector(praise) forControlEvents:UIControlEventTouchUpInside];
        [_praiseBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _praiseBtn;
}

- (void)praise {
    
    [UIView animateWithDuration:0.3 animations:^{
    self.prasieView.bottom = self.praiseBtn.top + 10;
    self.prasieView.alpha = 1;
        
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
  
    [UIView animateWithDuration:0.3 animations:^{
        self.prasieView.bottom = self.praiseBtn.top - 10;
        self.prasieView.alpha = 0;
    }];
}

@end
