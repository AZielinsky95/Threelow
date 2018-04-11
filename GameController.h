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

@property NSMutableArray<Dice*>* m_Dice;
@property NSMutableArray<Dice*>* m_HeldDice;

-(void)holdDie:(NSString*)userInput;

@end
