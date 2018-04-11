//
//  main.m
//  Threelow
//
//  Created by Alejandro Zielinsky on 2018-04-10.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Dice *dice1 = [[Dice alloc] init];
        Dice *dice2 = [[Dice alloc] init];
        Dice *dice3 = [[Dice alloc] init];
        Dice *dice4 = [[Dice alloc] init];
        Dice *dice5 = [[Dice alloc] init];
    
        while(true)
        {
            NSLog(@"TYPE 'roll' to Roll your 5 dice");
            char inputChars[255];
            fgets(inputChars,255,stdin);
            
            NSString *userInput = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
            
            userInput = [userInput stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
            
            if([userInput isEqualToString:(@"roll")])
            {
                [dice1 randomizeValue];
                [dice2 randomizeValue];
                [dice3 randomizeValue];
                [dice4 randomizeValue];
                [dice5 randomizeValue];
                
                NSLog(@"Dice 1 : %ld ",(long)dice1.m_CurrentValue);
                NSLog(@"Dice 2 : %ld ",(long)dice2.m_CurrentValue);
                NSLog(@"Dice 3 : %ld ",(long)dice3.m_CurrentValue);
                NSLog(@"Dice 4 : %ld ",(long)dice4.m_CurrentValue);
                NSLog(@"Dice 5 : %ld ",(long)dice5.m_CurrentValue);
            }
        }
    }
    return 0;
}
