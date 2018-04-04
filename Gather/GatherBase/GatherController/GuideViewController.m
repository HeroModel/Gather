//
//  GuideViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/18.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "GuideViewController.h"
#import "AppDelegate.h"
#import "GatherBarViewController.h"
#define isImageNameString(string)  ([[UIImage imageNamed:string] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal])

@interface GuideViewController ()<UIScrollViewDelegate, SDCycleScrollViewDelegate>
/** <#注释#> */
@property(nonatomic, strong) UIScrollView * scrollView;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createScrollerView];
}
#pragma mark - 创建 VC
+ (instancetype)sharedGuideVC {
    static GuideViewController *guidePageVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        guidePageVC = [[GuideViewController alloc] init];
    });
    return guidePageVC;
}
#pragma mark - ScrollerViewSomethings
- (void)createScrollerView
{
        UIImage * image1 = isImageNameString(@"guide1");
        UIImage * image2 = isImageNameString(@"guide2");
        UIImage * image3 = isImageNameString(@"guide3");
        UIImage * image4 = isImageNameString(@"guide4");
        NSArray * array = @[image1, image2, image3, image4];
    
    SDCycleScrollView *cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, YW_SCREEN_WIDTH, YW_SCREEN_HEIGHT) imageNamesGroup:array];
    cycleScrollView2.backgroundColor = [UIColor whiteColor];
    cycleScrollView2.infiniteLoop = NO;
    cycleScrollView2.autoScroll = NO;
    if (kDevice_Is_iPhoneX) {
       cycleScrollView2.pageControlBottomOffset = 35;
    }else{
       cycleScrollView2.pageControlBottomOffset = 0;
    }
    cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    cycleScrollView2.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    cycleScrollView2.currentPageDotColor = [UIColor greenColor]; // 自定义分页控件小圆标颜色
    cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;//pageController样式
    cycleScrollView2.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方式
    cycleScrollView2.delegate = self;
    [self.view addSubview:cycleScrollView2];
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    if (index == 3) {
        AppDelegate * app = (AppDelegate *)[UIApplication sharedApplication].delegate;
        app.window.rootViewController = [[GatherBarViewController alloc] init];
    }
    else{
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
