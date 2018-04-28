//
//  Calculator.h
//  Gather
//
//  Created by apple on 2018/4/28.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
/** 结果 */
@property(nonatomic, assign) NSInteger result;
/** 加 */
//@property(nonatomic, copy, readonly) Calculator * (^add)(NSInteger num);
- (Calculator * (^)(NSInteger num))add;
/** 减 */
//@property(nonatomic, copy, readonly) Calculator * (^minus)(NSInteger num);
- (Calculator * (^)(NSInteger num))minus;
/** 乘 */
//@property(nonatomic, copy, readonly) Calculator * (^multiply)(NSInteger num);
- (Calculator * (^)(NSInteger num))multiply;
/** 除 */
//@property(nonatomic, copy, readonly) Calculator * (^divide)(NSInteger num);
- (Calculator * (^)(NSInteger num))divide;
/** and */
- (Calculator *)and1;
/** with */
- (Calculator *)with;
@end
