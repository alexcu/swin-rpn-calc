/**
 * @class   ACRpnCalculator
 * @version 1.0
 * @file    ACRpnCalculator.h
 * @author  Alex Cummaudo
 * @date    19 Sept 2013
 * @brief   RpnCalculator for unit testing
 */

#import <Foundation/Foundation.h>

@interface ACRpnCalculator : NSObject {
    //! Declare ivars
    NSMutableArray *_operands;
    
}

@property NSMutableArray *stack;

//! Declare Methods
-(void) push:(int) val;
-(int)  answer;

-(void) add;
-(void) subtract;
-(void) multiply;
-(void) divide;

@end
