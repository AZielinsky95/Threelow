//
//  Dice.m
//  Threelow
//
//  Created by Alejandro Zielinsky on 2018-04-10.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(void)randomizeValue
{
    _m_CurrentValue = arc4random_uniform(6) + 1;
}

@end
