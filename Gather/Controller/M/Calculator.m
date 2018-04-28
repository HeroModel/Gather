//
//  Calculator.m
//  Gather
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator
- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.result = 0;
    return self;
}
- (Calculator *(^)(NSInteger num))add
{
    return ^id(NSInteger num){
        self.result += num;
        return self;
    };
}
- (Calculator *(^)(NSInteger num))minus
{
    return ^id(NSInteger num){
        self.result -= num;
        return self;
    };
}
- (Calculator *(^)(NSInteger num))multiply
{
    return ^id(NSInteger num){
        self.result *= num;
        return self;
    };
}
- (Calculator *(^)(NSInteger num))divide
{
    return ^id(NSInteger num){
        NSAssert(num != 0, @"除数不能为0");
        self.result /= num;
        return self;
    };
}
- (Calculator *)and1
{
    return self;
}
- (Calculator *)with
{
    return self;
}
@end
