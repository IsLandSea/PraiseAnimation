//
//  PraiseView.m
//  weibo
//
//  Created by admin on 2018/7/25.
//  Copyright © 2018年 admin. All rights reserved.
//
#import "PraiseView.h"
#import "UIView+Extension.h"


@implementation PraiseView

- (instancetype)init {
    if (self = [super init]) {
        [self initUI];
    }
    return self;
}
- (void)initUI {
    
        [self addSubview:self.sadImageView];
        [self addSubview:self.happyImageView];
        [self addSubview:self.angryImageView];
        [self addSubview:self.heartImageView];
    
}
- (YYAnimatedImageView *)sadImageView {
    if (!_sadImageView) {
        UIImage *image = [YYImage imageNamed:@"sad.gif"];
        _sadImageView = [[YYAnimatedImageView alloc] initWithImage:image];
        _sadImageView.frame = CGRectMake(15,10,20,20);
    }
    return _sadImageView;
}
- (YYAnimatedImageView *)happyImageView {
    if (!_happyImageView) {
        UIImage *happyImage = [YYImage imageNamed:@"happy.gif"];
       _happyImageView = [[YYAnimatedImageView alloc] initWithImage:happyImage];
       _happyImageView.frame = CGRectMake(self.sadImageView.right + 15,10,20,20);
    }
    return _happyImageView;
}
- (YYAnimatedImageView *)angryImageView {
    if (!_angryImageView) {
        UIImage *sadImage = [YYImage imageNamed:@"angry.gif"];
        _angryImageView = [[YYAnimatedImageView alloc] initWithImage:sadImage];
        _angryImageView.frame = CGRectMake(self.happyImageView.right + 15,10,20,20);
    }
    return _angryImageView;
}
- (YYAnimatedImageView *)heartImageView {
    if (!_heartImageView) {
        UIImage *heartImage = [YYImage imageNamed:@"heart.gif"];
        _heartImageView = [[YYAnimatedImageView alloc] initWithImage:heartImage];
       _heartImageView.frame = CGRectMake(self.angryImageView.right + 15,10,20,20);
    }
    return _heartImageView;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self touch:touches withEvent:event];
}
- (void)touch:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch * touch = touches.anyObject;//获取触摸对象
    CGPoint point = [touch locationInView:self];
    CGPoint sadPoint     = [self.sadImageView convertPoint:point fromView:self];
    CGPoint happyPoint   = [self.happyImageView convertPoint:point fromView:self];
    CGPoint angryPoint   = [self.angryImageView convertPoint:point fromView:self];
    CGPoint heartPoint   = [self.heartImageView convertPoint:point fromView:self];
    if ([self.sadImageView pointInside:sadPoint withEvent:event]) {
        
        [self imageViewAnimation:self.sadImageView identityImageView:self.heartImageView cgAffineImageView:self.happyImageView transforImageView:self.angryImageView];

    }else if ([self.happyImageView pointInside:happyPoint withEvent:event]) {
        
        [self imageViewAnimation:self.happyImageView identityImageView:self.heartImageView cgAffineImageView:self.sadImageView transforImageView:self.angryImageView];

    }else if([self.angryImageView pointInside:angryPoint withEvent:event]) {
        
        [self imageViewAnimation:self.angryImageView identityImageView:self.heartImageView cgAffineImageView:self.sadImageView transforImageView:self.happyImageView];

    }
    else if([self.heartImageView pointInside:heartPoint withEvent:event]) {
        
        [self imageViewAnimation:self.heartImageView identityImageView:self.angryImageView cgAffineImageView:self.sadImageView transforImageView:self.happyImageView];
    }
}
- (void)imageViewAnimation:(YYAnimatedImageView *)imaegView identityImageView:(YYAnimatedImageView *)identdimaegView  cgAffineImageView:(YYAnimatedImageView *)cgAffineImageView transforImageView:(YYAnimatedImageView *)transforImageView {
    [UIView animateWithDuration:0.3 animations:^{
        imaegView.transform = CGAffineTransformMakeScale(2, 2);
        identdimaegView.transform = CGAffineTransformIdentity;
        cgAffineImageView.transform = CGAffineTransformIdentity;
        transforImageView.transform = CGAffineTransformIdentity;
    }];
    if (self.chooseImageBlock) {
        self.chooseImageBlock(imaegView);
    }
}
@end
