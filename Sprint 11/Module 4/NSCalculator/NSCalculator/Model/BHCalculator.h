//
//  BHCalculator.h
//  NSCalculator
//
//  Created by Benjamin Hakes on 2/28/19.
//  Copyright © 2019 Benjamin Hakes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, RPNOperator){
    RPNOperatorAdd,
    RPNOperatorSubtract,
    RPNOperatorMultiply,
    RPNOperatorDivide
};

@interface BHCalculator : NSObject



@end

NS_ASSUME_NONNULL_END
