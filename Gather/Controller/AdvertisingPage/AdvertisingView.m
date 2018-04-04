//
//  AdvertisingView.m
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "AdvertisingView.h"
@interface AdvertisingView()
@property (nonatomic, strong) UIButton *countBtn;
@property (nonatomic, strong) NSTimer *countTimer;
@property (nonatomic, assign) int count;
@end
//广告显示的时间
static int const showtime = 6;
@implementation AdvertisingView

- (NSTimer *)countTimer
{
    if (!_countTimer) {
        _countTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    }
    return _countTimer;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        // 1.广告图片
        _adView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, YW_SCREEN_WIDTH, 560 * WIDTHFIT)];
        _adView.image = [UIImage imageNamed:@"top_Page"];
        _adView.userInteractionEnabled = YES;
        _adView.contentMode = UIViewContentModeScaleToFill;
        _adView.clipsToBounds = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushToAd)];
        [_adView addGestureRecognizer:tap];
        [self addSubview:_adView];
        
//        UIImageView * bottomImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(_adView.frame), YW_SCREEN_WIDTH , 107 * WIDTHFIT)];
        UIImageView * bottomImage = [[UIImageView alloc] init];
        bottomImage.image = [UIImage imageNamed:@"loading_nothing"];
        bottomImage.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:bottomImage];
        [bottomImage makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_adView.bottom);
            make.left.equalTo(110 * WIDTHFIT);
            make.right.equalTo(-110 * WIDTHFIT);
            make.height.equalTo(70 * WIDTHFIT);
        }];
        
        // 2.跳过按钮
        CGFloat btnW = 60 * WIDTHFIT;
        CGFloat btnH = 30 * HEIGHTFIT;
        CGFloat btnR = 15 * WIDTHFIT;
        CGFloat btnT = 37 * HEIGHTFIT;
        CGFloat btnPXT = 57;
        _countBtn = [UIButton ButtonWithType:UIButtonTypeCustom WithString:nil WithBackgroundColor:[UIColor whiteColor] WithTextColor:[UIColor blackColor] WithFont:NAM_TITLE target:self action:@selector(dismiss)];
        [_countBtn setTitle:[NSString stringWithFormat:@"跳过%ds", showtime] forState:UIControlStateNormal];
        if (kDevice_Is_iPhoneX) {
            _countBtn.frame = CGRectMake(YW_SCREEN_WIDTH - btnW - btnR, btnPXT, btnW, btnH);
        }else{
            _countBtn.frame = CGRectMake(YW_SCREEN_WIDTH - btnW - btnR, btnT, btnW, btnH);
        }
        _countBtn.layer.cornerRadius = 4;
        
        
        
        [self addSubview:_countBtn];
        
    }
    return self;
}
- (void)setFilePath:(NSString *)filePath
{
    _filePath = filePath;
    _adView.image = [UIImage imageWithContentsOfFile:filePath];
}

- (void)pushToAd{
    
    [self dismiss];
    [Notification postNotificationName:NotificationContants_Advertise_Key object:nil userInfo:_dic];
}
- (void)countDown
{
    _count --;
    [_countBtn setTitle:[NSString stringWithFormat:@"跳过%ds",_count] forState:UIControlStateNormal];
    if (_count == 0) {
        [self.countTimer invalidate];
        self.countTimer = nil;
        [self dismiss];
    }
}

- (void)show
{
    // 倒计时方法1：GCD
    //        [self startCoundown];
    
    // 倒计时方法2：定时器
    [self startTimer];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}

// 定时器倒计时
- (void)startTimer
{
    _count = showtime;
    [[NSRunLoop mainRunLoop] addTimer:self.countTimer forMode:NSRunLoopCommonModes];
}

// GCD倒计时
- (void)startCoundown
{
    __block int timeout = showtime + 1; //倒计时时间 + 1
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0 * NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout <= 0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismiss];
                
            });
        }else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [_countBtn setTitle:[NSString stringWithFormat:@"跳过%ds",timeout] forState:UIControlStateNormal];
                //                [_countBtn setTitleColor:randomColor forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

// 移除广告页面
- (void)dismiss
{
    //    UIViewAnimationOptions option = UIViewAnimationOptionCurveLinear | UIViewAnimationOptionTransitionFlipFromRight;
    //    [UIView transitionWithView:self duration:1.0f options:option animations:^{
    //        self.alpha = 0.f;
    //    } completion:^(BOOL finished) {
    //        [self removeFromSuperview];
    //    }];
    
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
-(void)dealloc
{
    [Notification removeObserver:self];
    [Notification removeObserver:NotificationContants_Advertise_Key];
}

@end
