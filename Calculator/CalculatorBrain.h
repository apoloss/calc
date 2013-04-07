//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Agustin Polito on 3/29/13.
//  Copyright (c) 2013 Agustin Polito. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(int)operand;
-(int)performOperation:(NSString *)type;

@end
