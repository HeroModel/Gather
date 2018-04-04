//
//  POPTableViewController.m
//  Gather
//
//  Created by apple on 2018/4/4.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "POPTableViewController.h"
#import "ClassifyTableViewCell.h"
#import "ShowNavViewController.h"
#import "CustomNavViewController.h"

@interface POPTableViewController ()
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end

@implementation POPTableViewController
- (NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray arrayWithObjects:@"有导航栏", @"自定义导航栏",nil];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _navTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
            ShowNavViewController *detailViewController = [[ShowNavViewController alloc] initWithNibName:@"ShowNavViewController" bundle:nil];
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
            break;
        case 1:
        {
            CustomNavViewController *detailViewController = [[CustomNavViewController alloc] init];
            [self.navigationController pushViewController:detailViewController animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
