//
//  myPet.m
//  Phonagotchi
//
//  Created by Kit Clark-O'Neil on 2018-08-09.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "myPet.h"

@implementation myPet


-(void)isPetOrAbused: (BOOL) abuse{
    if (abuse == YES)
    {
    self.moodState = @"grumpy";
    }
    else self.moodState = @"default";
    
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _moodState = @"default";
    }
    return self;
}
@end
