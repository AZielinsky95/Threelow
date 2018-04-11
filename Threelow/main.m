//
//  main.m
//  Threelow
//
//  Created by Alejandro Zielinsky on 2018-04-10.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"
#import "InputHandler.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        GameController *controller = [[GameController alloc] init];
        InputHandler *inputHandler = [[InputHandler alloc] init];
        
        while(true)
        {
            NSLog(@"TYPE 'roll' to Roll your dice or TYPE 'reset' to reset Dice");
            
            NSString *userInput =  [inputHandler getUserInput];
            
            if([userInput isEqualToString:(@"roll")])
            {
               for(NSNumber *index in controller.m_Dice)
               {
                   [controller.m_Dice[index] randomizeValue];
                   NSLog(@"Dice %@ : %ld ",index,(long)[controller.m_Dice[index] m_CurrentValue]);
               }
            }
            else if([userInput isEqualToString:(@"reset")])
            {
                [controller resetDice];
            }
            
            NSLog(@"TYPE 'Dice Numbers to Hold'");
            userInput =  [inputHandler getUserInput];
            [controller holdDie:(userInput)];
        }
    }
    return 0;
}
