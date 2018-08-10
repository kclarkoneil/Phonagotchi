//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "myPet.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) myPet *currentPet;
@property (nonatomic) UIImageView *appleBucket;
@property (nonatomic) UIImageView *Apple;
@property (nonatomic) UIImageView *currentApple;

@end

@implementation LPGViewController

- (void)viewDidLoad

{
    [super viewDidLoad];
    
    //Initialize background, set currentPet
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    myPet *steve = [[myPet alloc] init];
    self.currentPet = steve;
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.petImageView];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.petImageView.image = [UIImage imageNamed:self.currentPet.moodState];
    [self.petImageView setUserInteractionEnabled:YES];
    
    //Initialize apple bucket image to bottom left corner
    self.appleBucket = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.appleBucket];
    self.appleBucket.translatesAutoresizingMaskIntoConstraints = NO;
    self.appleBucket.image = [UIImage imageNamed:@"bucket"];
    [self.appleBucket setUserInteractionEnabled:YES];
    
    self.Apple = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.Apple];
    self.Apple.translatesAutoresizingMaskIntoConstraints = NO;
    self.Apple.image = [UIImage imageNamed:@"apple"];
    [self.Apple setUserInteractionEnabled:YES];
    
    
    
    [NSLayoutConstraint constraintWithItem:self.appleBucket
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeBottomMargin
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleBucket
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeLeftMargin
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleBucket
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0 constant:70].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.appleBucket
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0 constant:70].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.Apple
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.appleBucket
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.Apple
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.appleBucket
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0 constant:0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.Apple
                                 attribute:NSLayoutAttributeHeight
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.Apple
                                 attribute:NSLayoutAttributeWidth
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:nil
                                 attribute:NSLayoutAttributeNotAnAttribute
                                multiplier:1.0 constant:30].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    [NSLayoutConstraint constraintWithItem:self.petImageView
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0
                                  constant:0.0].active = YES;
    
    
    UIPanGestureRecognizer *petTheCat = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(howTheCatWasPet:)];
    [self.petImageView addGestureRecognizer:petTheCat];
   
    UILongPressGestureRecognizer *grabTheApple = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(createAnApple:)];
    [self.appleBucket addGestureRecognizer:grabTheApple];
    
    
   
    
    


}
-(void)howTheCatWasPet:(UIPanGestureRecognizer *)gesture {

CGPoint velocity = [gesture velocityInView:self.view];
if (velocity.x > 150 || velocity.x < -150 || velocity.y > 150 || velocity.y < -150)
{
    [self.currentPet isPetOrAbused:YES];
}
else
{
    [self.currentPet isPetOrAbused:NO];
}
    self.petImageView.image = [UIImage imageNamed:self.currentPet.moodState];
}
-(void)createAnApple: (UILongPressGestureRecognizer *)longPressure{
    
    self.currentApple = [[UIImageView alloc] initWithFrame:CGRectOffset(self.Apple.frame,  0, 0)];
    
    [self.view addSubview:self.currentApple];
    self.currentApple.image = [UIImage imageNamed:@"apple"];
    
    [self.currentApple setUserInteractionEnabled:YES];
    UIPanGestureRecognizer *dragTheApple = [[UIPanGestureRecognizer alloc] initWithTarget: self action:@selector(feedTheCat:)];
    [self.currentApple addGestureRecognizer:dragTheApple];
   
}
-(void)feedTheCat: (UIPanGestureRecognizer*) pan {
    
    CGPoint translation = [pan translationInView:self.currentApple];
    self.currentApple.center = CGPointMake(self.currentApple.center.x + translation.x, self.currentApple.center.y + translation.y);
    [pan setTranslation:CGPointZero inView:self.currentApple];
    
    if (pan.state == UIGestureRecognizerStateEnded){
        if (self.currentApple.center.x > self.petImageView.frame.origin.x && self.currentApple.center.x < (self.petImageView.frame.origin.x + self.petImageView.frame.size.width ) && (self.currentApple.center.y > self.petImageView.frame.origin.y && self.currentApple.center.y < (self.petImageView.frame.origin.y + self.petImageView.frame.size.height ))) {
            [self.currentApple removeFromSuperview];
        }
        else {
            [UIView animateWithDuration:1.0 animations:^{
                self.currentApple.center = CGPointMake(self.currentApple.center.x, 1000);
            } completion:^(BOOL finished) {
                [self.currentApple removeFromSuperview];
            }];
            
            
        }
        }
    }
    
@end
