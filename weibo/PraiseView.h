//
//  PraiseView.h
//  weibo
//
//  Created by admin on 2018/7/25.
//  Copyright © 2018年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYImage.h"

@interface PraiseView : UIView

@property (nonatomic,strong) YYAnimatedImageView *sadImageView ;
@property (nonatomic,strong) YYAnimatedImageView *happyImageView ;
@property (nonatomic,strong) YYAnimatedImageView *angryImageView ;
@property (nonatomic,strong) YYAnimatedImageView *heartImageView ;
@property (nonatomic,copy)void (^chooseImageBlock)(YYAnimatedImageView *imageView);

@end
