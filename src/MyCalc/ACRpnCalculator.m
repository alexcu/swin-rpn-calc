/**
 * @class   ACRpnCalculator
 * @version 1.0
 * @file    ACRpnCalculator.m
 * @author  Alex Cummaudo
 * @date    19 Sept 2013
 * @brief   Implements ACRpnCalculator
 */

#import "ACRpnCalculator.h"

@implementation ACRpnCalculator

@synthesize stack = _operands;

/**
 * @brief   Constructor for ACRpnCalculator
 *          initialises NSMutableArray
 */
-(id) init {
    if (self = [super init]) {
        _operands = [[NSMutableArray alloc] init];
    }
    return self;
}

/**
 * @brief   Returns the answer from the _operands
 */
-(int) answer {
    return [[_operands lastObject] intValue];
}

/**
 * @brief   Pushes a value to the _operands
 */
-(void) push:(int)val {
    NSNumber *valNSNumber = [NSNumber numberWithInt:val];
    [_operands addObject:valNSNumber];
}

/**
 * @brief   Pops a value from the _operands and returns it
 */
-(int) pop {
    int result = [[_operands lastObject] intValue];
    [_operands removeLastObject];
    return result;
}

/**
 * @brief   Adds the operands together by popping the
 *          operands off _operands (using pop method) 
 *          and then pushing the result of adding them
 *          to _operands (using push method)
 */
-(void) add {
    if ([self validOperands])
    {
        int val1 = [self pop];
        int val2 = [self pop];
        [self push:val1+val2];
    }
}

/**
 * @brief   Same as add, but subtracts from the first popped value
 */
-(void) subtract {
    if ([self validOperands])
    {
        int val1 = [self pop];
        int val2 = [self pop];
        [self push:val1-val2];
    }
}


/**
 * @brief   Same as add, but multiplies to the first popped value
 */
-(void) multiply {
    if ([self validOperands])
    {
        int val1 = [self pop];
        int val2 = [self pop];
        [self push:val1*val2];
    }
}

/**
 * @brief   Same as add, but divides by the first popped value
 */
-(void) divide {
    if ([self validOperands])
    {
        int val1 = [self pop];
        int val2 = [self pop];
        [self push:val2/val1];
    }
}

/**
 * @brief   Checks that there are at least two operands
 *          before calculations can be made
 * @note    This method is private
 */
-(BOOL) validOperands
{
    //! Where operands are less than two
    if ([_operands count] < 2)
    {
        //! Raise an exception, thereby causing
        //! the method to fail
        [NSException raise:@"InsufficientOperands"
                    format:@"Calculation requires at least 2 operands"];
    }
    //! Otherwise, proceed...
    return YES;
}


@end
