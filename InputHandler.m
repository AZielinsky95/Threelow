//
//  InputHandler.m
//  Maths
//
//  Created by Alejandro Zielinsky on 2018-04-10.
//  Copyright © 2018 Alejandro Zielinsky. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

-(NSString *)getUserInput
{
    char inputChars[255];
    fgets(inputChars,255,stdin);
    
    self.userInput = [NSString stringWithCString:inputChars encoding:NSUTF8StringEncoding];
    
    self.userInput = [self.userInput stringByTrimmingCharactersInSet: NSCharacterSet.whitespaceAndNewlineCharacterSet];
    
    return self.userInput;
}

@end
