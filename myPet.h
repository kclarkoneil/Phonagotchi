//
//  myPet.h
//  Phonagotchi
//
//  Created by Kit Clark-O'Neil on 2018-08-09.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myPet : NSObject

@property int howGrumpy;
@property BOOL isAsleep;
@property NSString *moodState;


-(void)isPetOrAbused:(BOOL)abuse;

@end
