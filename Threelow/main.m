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
        bool requiresReset = false;
        
        while(true)
        {
            if(requiresReset)
            {
             NSLog(@"TYPE 'reset' to reset Dice");
            }
            else
            {
             NSLog(@"TYPE 'roll' to Roll your dice or TYPE 'reset' to reset Dice");
            }
            
            NSString *userInput =  [inputHandler getUserInput];
            
            if([userInput isEqualToString:(@"roll")])
            {
                if(controller.m_NumberOfRolls >= 5)
                {
                     NSLog(@"Please reset your dice");
                     requiresReset = true;
                }
                else
                {
                    for(NSNumber *index in controller.m_Dice)
                    {
                        [controller.m_Dice[index] randomizeValue];
                    }
                    
                    [controller setM_NumberOfRolls:(controller.m_NumberOfRolls + 1)];
                    [controller printScore];
                }
            }
            else if([userInput isEqualToString:(@"reset")])
            {
                [controller resetDice];
                requiresReset = false;
            }
            
            //Allow to player to hold dice if he does not require to reset
            if(!requiresReset)
            {
                bool hasHeldDice = false;
                
                while(!hasHeldDice)
                {
                NSLog(@"TYPE 'Dice Numbers to Hold'");
                userInput =  [inputHandler getUserInput];
                    
                if([userInput isEqualToString:(@"")])
                {
                    NSLog(@"No Dice to hold have been inputted! :( ");
                }
                else
                {
                    [controller holdDie:(userInput)];
                    hasHeldDice = true;
                }
                    
                }
            }
        }
    }
    return 0;
}
