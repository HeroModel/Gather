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

@interface BasisTableViewController ()
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end

@implementation BasisTableViewController
- (NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray arrayWithObjects:@"标签", @"文本框", nil];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nil"] style:UIBarButtonItemStylePlain target:nil action:nil];
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
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];

   LabelAttributedStringViewController * labelString = [[LabelAttributedStringViewController alloc] init];
    labelString.navTitle = self.array[indexPath.row];
    [labelString setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:labelString animated:YES];
}



@end
