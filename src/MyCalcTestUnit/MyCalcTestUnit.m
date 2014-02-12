//
//  MyCalcTestUnit.m
//  MyCalcTestUnit
//
//  Created by Alex on 19/09/13.
//  Copyright (c) 2013 Alex Cummaudo. All rights reserved.
//
#import "ACRpnCalculator.h"

#import <SenTestingKit/SenTestingKit.h>

@interface MyCalcTestUnit : SenTestCase

@end
@implementation MyCalcTestUnit

//! Note requied syntax testX where X = method
-(void) testPush
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    //! Test answer
    [calc push:5];
    testAnswer = [calc answer];
    
    //! So we compare human-calculated answer 5
    //! to whatever the computer calculated for us
    STAssertEquals(5, testAnswer, @"Testing push 5");
}

-(void)testAdd
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    [calc push:2];
    [calc push:2];
    [calc add];

    testAnswer = [calc answer];
    
    STAssertEquals(4, testAnswer, @"2 + 2 = 4");
}

-(void)testMultipleAdd
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    [calc push:1];
    [calc push:1];
    [calc push:1];
    [calc add];
    [calc add];
    testAnswer = [calc answer];
    
    STAssertEquals(3, testAnswer, @"1+1+1 = 3");
}

-(void)testSubtract
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    [calc push:1];
    [calc push:1];
    [calc subtract];
    testAnswer = [calc answer];
    
    STAssertEquals(0, testAnswer, @"1-1 = 0");
}

-(void)testMultiply
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    [calc push:5];
    [calc push:4];
    [calc multiply];
    testAnswer = [calc answer];
    
    STAssertEquals(20, testAnswer, @"5*4 = 20");
}

-(void)testDivide
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    [calc push:20];
    [calc push:4];
    [calc divide];
    testAnswer = [calc answer];
    
    STAssertEquals(5, testAnswer, @"20/4 = 5");
}

-(void)testBodmas
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    [calc push:1];
    [calc push:5];
    [calc push:4];
    [calc multiply];
    [calc push:4];
    [calc divide];
    [calc add];
    testAnswer = [calc answer];
    
    STAssertEquals(6, testAnswer, @"BODMAS gives 6");
}

-(void) testAddError
{
    ACRpnCalculator *calc = [[ACRpnCalculator alloc] init];
    int testAnswer;
    
    //! Push just one value to the calc
    [calc push:1];

    
    @try
    {
        //! Try to add two values
        [calc add];
    }
    //! But this will cause an exception since
    //! we can't add only one value together
    //! (i.e. the valid operands check will
    //! raise an exception and this will catch
    //! that exception)
    @catch (NSException *exception)
    {
        testAnswer = [calc answer];
        
        STAssertEquals(1, testAnswer, @"1 should remain on the RPN stack");
        return;
    }
    @catch (NSException *exception)
    {
        
    }
    //! If the exception was not caught, then something went wrong!
    STAssertTrue(NO, @"An exception should have been raised in add.");
}

 

@end
