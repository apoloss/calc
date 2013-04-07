//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Agustin Polito on 3/28/13.
//  Copyright (c) 2013 Agustin Polito. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
    @property (nonatomic, strong) CalculatorBrain *brain;
    @property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize brain = _brain;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;

- (CalculatorBrain *) brain{
    if(!_brain){
        _brain = [[CalculatorBrain alloc]init];
    }
    return _brain;
}
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if(self.userIsInTheMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:digit];
    } else {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }

    
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text intValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}
- (IBAction)performSum:(UIButton *)sender {
    if (self.userIsInTheMiddleOfEnteringANumber) {
        [self enterPressed];
    }
    self.display.text = [NSString stringWithFormat:@"%d",[self.brain performOperation:sender.currentTitle]];
    
}

@end
