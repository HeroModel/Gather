//
//  AdvertisingView.h
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GatherBaseView.h"
static NSString *const adImageName = @"adImageName";
@interface AdvertisingView : GatherBaseView
/** 显示广告页面方法*/
- (void)show;
@property (nonatomic, strong) UIImageView *adView;
/** 图片路径*/
@property (nonatomic, copy) NSString *filePath;
/** <#注释#> */
@property(nonatomic, copy) NSString * imageUrl;
/** <#注释#> */
@property(nonatomic, strong) NSMutableDictionary * dic;
@end
