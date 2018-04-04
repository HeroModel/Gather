//
//  BasisTableViewController.m
//  Gather
//
//  Created by apple on 2018/3/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "BasisTableViewController.h"
#import "ClassifyTableViewCell.h"
#import "LabelAttributedStringViewController.h"
#import "POPTableViewController.h"

@interface BasisTableViewController ()
<JMDropMenuDelegate>
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** titleArr */
@property (nonatomic, strong) NSMutableArray *titleArr;
/** imgArr */
@property (nonatomic, strong) NSMutableArray *imageArr;
@end

@implementation BasisTableViewController
- (NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray arrayWithObjects:@"关于 YYTextView 使用", @"侧滑返回",nil];
    }
    return _array;
}
- (NSMutableArray *)titleArr
{
    if (!_titleArr) {
        _titleArr = [NSMutableArray arrayWithObjects:@"创建群聊",@"加好友/群",@"扫一扫",@"付款",@"拍摄", nil];
    }
    return _titleArr;
}
- (NSMutableArray *)imageArr
{
    if (!_imageArr) {
        _imageArr = [NSMutableArray arrayWithObjects:@"img1",@"img2",@"img3",@"img4",@"img5", nil];
    }
    return _imageArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.titleArr = @[@"创建群聊",@"加好友/群",@"扫一扫",@"付款",@"拍摄"];
//    self.imageArr = @[@"img1",@"img2",@"img3",@"img4",@"img5"];
    
    //下拉菜单
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(navLeftClick)];
    self.navigationItem.title = @"基 础";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * CellIdentifier = @"Cell";
    BOOL nibsRegistered = NO;
    if (!nibsRegistered) {
        UINib * nib = [UINib nibWithNibName:NSStringFromClass([ClassifyTableViewCell class]) bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        nibsRegistered = YES;
    }
    ClassifyTableViewCell * cell = (ClassifyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.nameLabel.text = self.array[indexPath.row];
    return cell;
    
    
    return cell;
}

#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
        {
            LabelAttributedStringViewController * labelString = [[LabelAttributedStringViewController alloc] init];
            labelString.navTitle = self.array[0];
            [labelString setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:labelString animated:YES];
            
        }
            break;
        case 1:
        {
            POPTableViewController * labelString = [[POPTableViewController alloc] init];
            labelString.navTitle = self.array[1];
            [labelString setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:labelString animated:YES];
            
        }
            break;
        default:
            break;
    }
    
    
}

#pragma mark - 左边
- (void)navLeftClick {
    
//    JMDropMenu *dropMenu = [[JMDropMenu alloc] initWithFrame:CGRectMake(8, 64, 120, 208) ArrowOffset:14.f TitleArr:self.titleArr ImageArr:self.imageArr Type:JMDropMenuTypeQQ LayoutType:JMDropMenuLayoutTypeNormal RowHeight:40.f Delegate:self];
//    dropMenu.titleColor = [UIColor redColor];
//    dropMenu.lineColor = [UIColor greenColor];
//    dropMenu.arrowColor = [UIColor blueColor];
    
    [JMDropMenu showDropMenuFrame:CGRectMake(8, 64, 120, 208) ArrowOffset:20.f TitleArr:self.titleArr ImageArr:self.imageArr Type:JMDropMenuTypeWeChat LayoutType:JMDropMenuLayoutTypeNormal RowHeight:40.f Delegate:self];
}
- (void)didSelectRowAtIndex:(NSInteger)index Title:(NSString *)title Image:(NSString *)image {
//    NSLog(@"index----%ld,  title---%@, image---%@", (long)index, title, image);
}
@end
