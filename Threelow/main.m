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
            NSLog(@"TYPE 'roll' to Roll your 5 dice");

            NSString *userInput =  [inputHandler getUserInput];
            
            if([userInput isEqualToString:(@"roll")])
            {
                for (int i=0; i < controller.m_Dice.count; i++)
                {
                    [controller.m_Dice[i] randomizeValue];
                    NSLog(@"Dice %d : %ld ",i,(long)controller.m_Dice[i].m_CurrentValue);
                }
            }
            
            NSLog(@"TYPE 'Dice Numbers to Hold'");
            userInput =  [inputHandler getUserInput];
            [controller holdDie:(userInput)];
        }
    }
    return 0;
}
