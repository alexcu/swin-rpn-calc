//
//  ACAppDelegate.m
//  MyCalc GUI
//
//  Created by Alex on 9/10/13.
//  Copyright (c) 2013 Alex Cummaudo. All rights reserved.
//

#import "ACAppDelegate.h"
#import "ACRpnCalculator.h"

@implementation ACAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    //! Init the calculator
    _calc = [[ACRpnCalculator alloc] init];
}

/**
 * @brief   Button click method for numbers adds the number
 *          to the text field
 */
- (IBAction)numberButtonClick:(NSButton *)sender
{
    //! Value of the number == its title
    NSString *value = [sender title];
    
    //! Get the text box value to append to
    NSString *data = [_numbers stringValue];
    
    //! Append the value to the currently existing data
    NSString *appendedData = [data stringByAppendingString:value];
    
    //! Now assign the text box the new string
    [_numbers setStringValue:appendedData];
}

/**
 * @brief   Enter button pushes the value from the 
 *          text box to the calc
 */
- (IBAction)enterButtonClick:(NSButton *)sender
{
    [_calc push:[_numbers intValue]];
    [_numbers setStringValue:@""];
    [self populateStack];
    [self playSound:@"Bottle"];
}

/**
 * @brief   Performs addition on values for calc
 */
- (IBAction)addButtonClick:(NSButton *)sender
{
    [_calc add];
    [self addToStack:@"+"];
    [self playSound:@"Bottle"];
}

/**
 * @brief   Performs addition on values for calc
 */
- (IBAction)multiplyButtonClick:(NSButton *)sender
{
    [_calc multiply];
    [self addToStack:@"×"];
    [self playSound:@"Bottle"];
}

/**
 * @brief   Performs addition on values for calc
 */
- (IBAction)subtractButtonClick:(NSButton *)sender
{
    [_calc subtract];
    [self addToStack:@"-"];
    [self playSound:@"Bottle"];
}

/**
 * @brief   Performs addition on values for calc
 */
- (IBAction)divideButtonClick:(NSButton *)sender
{
    [_calc divide];
    [self addToStack:@"÷"];
    [self playSound:@"Bottle"];
}

/**
 * @brief   Gets the answer from the stack and passes it
 *          to the _numbers string
 */
- (IBAction)answerButtonClick:(NSButton *)sender
{
    [_numbers setStringValue:[NSString stringWithFormat:@"%d", [_calc answer]]];
    [self populateStack];
    [self playSound:@"Pop"];
}

/**
 * @brief   Menu item click for clear stack which
 *          clears the calc stack and the ctrl stack
 */
- (IBAction)clearStack:(NSMenuItem *)sender
{
    [self clearCtrlStack];
    
    //! Clear calc stack too
    [[_calc stack] removeAllObjects];
    
    //! Clear the string
    [_numbers setStringValue:@""];
    
    [self playSound:@"Purr"];
}

/**
 * @brief   Clears everything contained in both the stack controller
 *          and the calc stack
 * @note    This method is private
 */
- (void) clearCtrlStack
{
    //! Set a range
    NSRange range = NSMakeRange(0, [[_stackController arrangedObjects] count]);
    
    //! Clear everything in the controller
    [_stackController removeObjectsAtArrangedObjectIndexes:[NSIndexSet indexSetWithIndexesInRange:range]];
}

/**
 * @brief   Binds the array values from the calc to the table view
 * @note    This method is private
 */
- (void)populateStack
{
    [self clearCtrlStack];
    
    //! Repopulate the controller stack
    for (int i = 0; i < _calc.stack.count; i++)
    {
        NSString *strAtIndex = [NSString stringWithFormat:@"%@", [_calc.stack objectAtIndex:i]];
        [self addToStack:strAtIndex];
    }
    
}

/**
 * @brief   Adds a string to the controller for the stack
 * @note    This method is private
 */
- (void)addToStack:(NSString*)str;
{
    //! Add it to the stack controller
    [_stackController insertObject:[NSMutableDictionary dictionaryWithObjectsAndKeys:str, @"stack", nil]
             atArrangedObjectIndex:0];
}

/**
 * @brief   Plays simple pop and push sounds
 */
- (void)playSound:(NSString*) sound;
{
    [[NSSound soundNamed:sound] play];
}

@end
