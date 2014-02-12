//
//  ACAppDelegate.h
//  MyCalc GUI
//
//  Created by Alex on 9/10/13.
//  Copyright (c) 2013 Alex Cummaudo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

//! Forward declare class
@class ACRpnCalculator;

@interface ACAppDelegate : NSObject <NSApplicationDelegate>
{
    //! ivar for the calc
    ACRpnCalculator *_calc;
}

@property (assign) IBOutlet NSWindow *window;

//! Numbers property (text field)
@property (weak) IBOutlet NSTextField *numbers;
@property (weak) IBOutlet NSArrayController *stackController;

- (IBAction)numberButtonClick:(NSButton *)sender;
- (IBAction)enterButtonClick:(NSButton *)sender;
- (IBAction)addButtonClick:(NSButton *)sender;
- (IBAction)multiplyButtonClick:(NSButton *)sender;
- (IBAction)subtractButtonClick:(NSButton *)sender;
- (IBAction)divideButtonClick:(NSButton *)sender;
- (IBAction)answerButtonClick:(NSButton *)sender;
- (IBAction)clearStack:(NSMenuItem *)sender;

@end
