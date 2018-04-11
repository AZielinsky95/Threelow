//
//  GameController.h
//  Threelow
//
//  Created by Alejandro Zielinsky on 2018-04-11.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

@interface GameController : NSObject

@property NSMutableDictionary* m_Dice;
@property NSMutableDictionary* m_HeldDice;
@property int m_NumberOfRolls;

-(void)holdDie:(NSString*)userInput;
-(void)resetDice;
-(void)printHeldDice;
-(void)printScore;

@end
