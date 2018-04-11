//
//  GameController.m
//  Threelow
//
//  Created by Alejandro Zielinsky on 2018-04-11.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        Dice *dice1 = [[Dice alloc] init];
        Dice *dice2 = [[Dice alloc] init];
        Dice *dice3 = [[Dice alloc] init];
        Dice *dice4 = [[Dice alloc] init];
        Dice *dice5 = [[Dice alloc] init];
        
        _m_Dice = [[NSMutableArray alloc] init];
        _m_HeldDice = [[NSMutableArray alloc] init];
        
        [_m_Dice addObject:(dice1)];
        [_m_Dice addObject:(dice2)];
        [_m_Dice addObject:(dice3)];
        [_m_Dice addObject:(dice4)];
        [_m_Dice addObject:(dice5)];
    }
    return self;
}

-(void)holdDie:(NSString*)userInput
{
    userInput = [userInput stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
    NSArray *components = [userInput componentsSeparatedByString:(@",")];
    
    for(NSNumber *index in components)
    {
        int i = [index intValue] - 1;
        [self.m_HeldDice addObject:(_m_Dice[i])];
        [_m_Dice removeObject:(_m_Dice[i])];
        
    }
    
     //[self.m_HeldDice addObject:(_m_Dice[diceIndex])];
     //[_m_Dice removeObject:(_m_Dice[diceIndex])];
    
}

@end
