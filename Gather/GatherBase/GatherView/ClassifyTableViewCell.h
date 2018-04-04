//
//  ClassifyTableViewCell.h
//  Gather
//
//  Created by apple on 2018/4/2.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "GatherBaseTableViewCell.h"

@interface ClassifyTableViewCell : GatherBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightTextLabel;

@end
