//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Agustin Polito on 3/29/13.
//  Copyright (c) 2013 Agustin Polito. All rights reserved.
//

#import "CalculatorBrain.h"


@interface CalculatorBrain()
    @property (nonatomic, strong) NSMutableArray *stack;
@end

@implementation CalculatorBrain

@synthesize stack = _stack;

/*Getters and setters of stack property*/
 
- (NSMutableArray *)stack {
    if(_stack == nil){
        _stack = [[NSMutableArray alloc]init];
    }
    return _stack;
}

/*End of getters and setters*/

- (void)pushOperand:(int)operand {
    [self.stack addObject:[NSNumber numberWithInt:operand]];
}

- (int)popOperand {
    NSNumber *ret = [self.stack lastObject];
    if (ret) {
        [self.stack removeLastObject];
    }
    return [ret intValue];
}

-(int)performOperation:(NSString *)type{
    int result = 0;
    if ([@"+" isEqualToString:type]) {
        result = [self popOperand] + [self popOperand];
        [self pushOperand:result];
    }

    return result;
}

@end
