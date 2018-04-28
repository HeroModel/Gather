//
//  FristTableViewController.m
//  Gather
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "FristTableViewController.h"

typedef BOOL(^RunLoopBlock)(void);
@interface FristTableViewController ()
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** 存放任务数组 */
@property(nonatomic, strong) NSMutableArray * tasks;
/** 任务标记 */
@property(nonatomic, strong) NSMutableArray * tasksKeys;
/** 最大任务数 */
@property(nonatomic, assign) NSUInteger max;
/** 时间 */
@property(nonatomic, strong) NSTimer * timer;
@end

@implementation FristTableViewController
- (void)updateTimer
{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nil"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.title = @"第一页";
    
    //NSDefaultRunLoopMode - 时钟，网络时间
    //NSRunLoopCommonModes - 用户交互
    
    _tasks = [NSMutableArray array];
    _tasksKeys = [NSMutableArray array];
    _max = 10;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    //    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //默认是NSDefaultRunLoopMode模式
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
 
 [self addTakes:^BOOL{
 [cell.commodityImage yy_setImageWithURL:[NSURL URLWithString:[IMAGE_URL stringByAppendingString:model.imgUrl]] placeholder:PLACEHOLDER];
 return YES;
 } Withkey:indexPath];
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark --- RunLoop相关
//添加任务
- (void)addTakes:(RunLoopBlock)unit Withkey:(id)key{
    [self.tasks addObject:unit];
    [self.tasksKeys addObject:key];
    if (self.tasks.count > self.max) {
        [self.tasks removeObjectAtIndex:0];
        [self.tasksKeys removeObjectAtIndex:0];
    }
}
//回调函数
//定一个回调函数 一次RunLoop来一次执行
static void CallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    FristTableViewController * accVC = (__bridge FristTableViewController *)(info);
    if (accVC.tasks.count == 0) {
        return;
    }
    BOOL reault = NO;
    while (reault == NO && accVC.tasks.count) {
        //获取到任务
        RunLoopBlock unit = accVC.tasks.firstObject;
        //执行任务
        reault = unit();
        //干掉第一个任务
        [accVC.tasks removeObjectAtIndex:0];
        //干掉第一个任务标识
        [accVC.tasksKeys removeObjectAtIndex:0];
    }
    
}

- (void)addRunLoopObserver
{
    //获取当前线程
    CFRunLoopRef runloop = CFRunLoopGetCurrent();
    
    //定义context
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *) (self),
        &CFRetain,
        &CFRelease,
        NULL
    };
    
    //定义观察者
    static CFRunLoopObserverRef defaultObserver;
    //创建观察者
    defaultObserver = CFRunLoopObserverCreate(NULL, kCFRunLoopBeforeWaiting, YES, NSIntegerMax - 999, &CallBack, &context);
    //添加观察者
    CFRunLoopAddObserver(runloop, defaultObserver, kCFRunLoopDefaultMode);
    //reselase
    CFRelease(defaultObserver);
    
    
}
@end
