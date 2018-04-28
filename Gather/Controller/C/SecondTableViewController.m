//
//  SecondTableViewController.m
//  Gather
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "SecondTableViewController.h"
#import "Calculator.h"

@interface SecondTableViewController ()

@end

@implementation SecondTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nil"] style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.title = @"第二页";
//    14367.02   722.94
    
//    NSArray * array = @[@1, @2, @3, @4, @5];
//    [array.rac_sequence.signal subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
    // 遍历字典,遍历出来的键值对会包装成RACTuple(元组对象
    NSDictionary *dict = @{@"name":@"张旭",@"age":@24};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        
        // RACTuple 就是一个元组，元组的概念在Swift有专门的介绍，没掌握的可以自己上网查一下！
        NSLog(@"RACTuple = %@",x);
        // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key,NSString *value) = x;
        
        //        相当于以下写法
        //        NSString *key = x[0];
        //        NSString *value = x[1];
        
        NSLog(@"%@ %@",key,value);
        
    }];
}
#pragma mark --- 链式函数式语法(Masonry)
- (void)createMasonry
{
    // (1)
//    Calculator * cal = [[Calculator alloc] init];
//    cal.add(1).minus(1).multiply(1).divide(1);
//    NSLog(@"%d", (int)cal.result);
    
    // (2)
    Calculator * cal = [[Calculator alloc] init];
    cal.add(1).and1.minus(1).with.multiply(1).and1.divide(1);
    NSLog(@"%d", (int)cal.result);
}
#pragma mark --- RAC
- (void)createRAC
{
    //热信号
    RACSubject * subject = [RACSubject subject];
    [subject sendNext:@1];
    [[RACScheduler mainThreadScheduler] afterDelay:0.5 schedule:^{
        [subject sendNext:@2];
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
        [subject sendNext:@3];
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:0.1 schedule:^{
        [subject subscribeNext:^(id x) {
            NSLog(@"subject1接收到了=====%@",x);        //0.1秒后subject1订阅了
        }];
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [subject subscribeNext:^(id x) {
            NSLog(@"subject2接收到了=====%@",x);        //1秒后subject2订阅了
        }];
    }];
    
    //冷信号
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        [[RACScheduler mainThreadScheduler] afterDelay:0.5 schedule:^{
            [subscriber sendNext:@2];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@3];
        }];
        return nil;
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:0.1 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"signal1接收到了%@", x);
        }];
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [signal subscribeNext:^(id x) {
            NSLog(@"signal2接收到了%@", x);
        }];
    }];
    
    RACMulticastConnection * connection = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@1];
        [[RACScheduler mainThreadScheduler] afterDelay:0.5 schedule:^{
            [subscriber sendNext:@2];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            [subscriber sendNext:@3];
        }];
        return nil;
    }] publish] ;
    [connection connect];
    RACSignal *signal1 = connection.signal;
    [[RACScheduler mainThreadScheduler] afterDelay:0.1 schedule:^{
        [signal1 subscribeNext:^(id x) {
            NSLog(@"这里是热信号1，接收到了%@", x);
        }];
    }];
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [signal1 subscribeNext:^(id x) {
            NSLog(@"这里是热信号2，接收到了%@", x);
        }];
    }];
    
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

@end
