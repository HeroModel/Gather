//
//  AppDelegate.m
//  Gather
//
//  Created by apple on 2018/3/26.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AppDelegate.h"
#import "GatherBarViewController.h"
#import "AdvertisingView.h"
#import "GuideViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
{
    AdvertisingView * advertiseView;
}
- (UIWindow *)window
{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    if (![UserDefaults valueForKey:@"first"]) {
        [UserDefaults setValue:@"sd" forKey:@"first"];
        self.window.rootViewController = [GuideViewController sharedGuideVC];
    }else{
        self.window.rootViewController = [[GatherBarViewController alloc] init];
    }
    
    [self addNetWorking];
    
    return YES;
}
#pragma mark --- 监听网络
- (void)addNetWorking
{
    // 网络监测
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态发生改变的时候调用这个block
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.label.text = @"WiFi";
                [hud hideAnimated:YES afterDelay:2];
                
                [UIView animateWithDuration:2 animations:^{
                    [self setupAdveriseView];
                    advertiseView = [[AdvertisingView alloc] initWithFrame:[UIScreen mainScreen].bounds];
                    [advertiseView show];
                }];
                
            }
                break;
                
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.label.text = @"蜂窝网络";
                [hud hideAnimated:YES afterDelay:2];
            }
                break;
                
            case AFNetworkReachabilityStatusNotReachable:
            {
                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.label.text = @"网络连接失败";
                [hud hideAnimated:YES afterDelay:2];
            }
                break;
                
            case AFNetworkReachabilityStatusUnknown:
            {
                MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].delegate.window  animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.label.text = @"网络未知错误";
                [hud hideAnimated:YES afterDelay:2];
            }
                break;
            default:
                break;
        }
    }];
    // 开始监控
    [mgr startMonitoring];
}


#pragma mark 启动广告
-(void)setupAdveriseView
{
    
    
//    NSArray <NSString *> *imagesURLS = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189872684&di=03f9df0b71bb536223236235515cf227&imgtype=0&src=http%3A%2F%2Fatt1.dzwww.com%2Fforum%2F201405%2F29%2F1033545qqmieznviecgdmm.gif", @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1495189851096&di=224fad7f17468c2cc080221dd78a4abf&imgtype=0&src=http%3A%2F%2Fimg3.duitang.com%2Fuploads%2Fitem%2F201505%2F12%2F20150512124019_GPjEJ.gif"];
//    [NetTools POSTNetWithUrl:ADVERTISING_PAGE
//                        body:nil
//                   bodyStyle:NetBodySTRING
//                   resopnese:NetJSON
//                     hearder:nil
//                     success:^(id result) {
//                         if ([result[@"code"] isEqualToString:@"0"]) {
//                             IDPersonallModel * model = [[IDPersonallModel alloc] initWithDic:result[@"data"]];
//                             [advertiseView.adView sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:model.imgUrl]] placeholderImage:[UIImage imageNamed:@"top_Page"]];
//                             advertiseView.dic = result[@"data"];
//                         }
//                     } failure:^(NSError *error) {
//                         advertiseView.adView.image = [UIImage imageNamed:@"top_Page"];
//                     }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
