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
        
        _m_Dice = [[NSMutableDictionary alloc] init];
        _m_HeldDice = [[NSMutableDictionary alloc] init];
        
        _m_Dice[@(1)] = dice1;
        _m_Dice[@(2)] = dice2;
        _m_Dice[@(3)] = dice3;
        _m_Dice[@(4)] = dice4;
        _m_Dice[@(5)] = dice5;
    }
    return self;
}

-(void)printScore
{
    for(NSNumber *index in self.m_Dice)
    {
        NSLog(@"Dice %@ : %ld ",index,(long)[self.m_Dice[index] m_CurrentValue]);
    }
    
    int score = 0;
    
    for(NSNumber *dice in self.m_HeldDice)
    {
        score += [self.m_HeldDice[dice] m_CurrentValue];
    }
    
    [self printHeldDice];
    
    NSLog(@"Score:  %d",score);
}

-(void)holdDie:(NSString*)userInput
{
    
    if([userInput isEqualToString:(@"")])
    {
        NSLog(@"No Dice to hold have been inputted! :( ");
    }
    else
    {
        
    NSArray *components = [userInput componentsSeparatedByString:(@",")];
        
    for(NSString *index in components)
    {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *i =  [formatter numberFromString:(index)];
        
        if(self.m_HeldDice[i])
        {
            _m_Dice[i] = self.m_HeldDice[i];
            [_m_HeldDice removeObjectForKey:(i)];
        }
        else
        {
             _m_HeldDice[i] = self.m_Dice[i];
             [_m_Dice removeObjectForKey:(i)];
        }
    }

        [self printHeldDice];
    }
}

-(void)printHeldDice
{
    for(NSNumber *index in self.m_HeldDice)
    {
        NSLog(@"Holding Dice [%@]", index);
    }
}

-(void)resetDice
{
    for(NSNumber *dice in self.m_HeldDice)
    {
        _m_Dice[dice] = self.m_HeldDice[dice];
    }
    
    [self.m_HeldDice removeAllObjects];
}

@end
