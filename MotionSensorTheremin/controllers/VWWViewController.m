\
//  VWWViewController.m
//  MotionSensorTheremin
//
//  Created by Zakk Hoyt on 7/29/13.
//  Copyright (c) 2013 Zakk Hoyt. All rights reserved.
//

#import "VWWViewController.h"
#import "VWWTouchScreenView.h"
#import "VWWThereminInput.h"


@interface VWWViewController ()
@property (weak, nonatomic) IBOutlet VWWTouchScreenView *touchScreenView;
@property (nonatomic, strong) VWWThereminInput *inputX1;
@property (nonatomic, strong) VWWThereminInput *inputY1;
@end

@implementation VWWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self configureSynthesizer];
    [self configureTouchScreenView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Private methods

-(void)configureSynthesizer
{
    _inputX1 = [[VWWThereminInput alloc]init];
    _inputY1 = [[VWWThereminInput alloc]init];
}

-(void)configureTouchScreenView
{
    void (^renderAudioTouchEvent)(NSSet *touches, UIEvent *event) = ^(NSSet *touches, UIEvent *event) {
        NSArray *touchesArray = [touches allObjects];
            UITouch *touch = touchesArray[0];
            CGPoint point = [touch locationInView:self.touchScreenView];
            float x = point.x / (float)self.touchScreenView.frame.size.width;
            float y = 1.0 - (point.y / (float)self.touchScreenView.frame.size.height);
            self.inputX1.frequencyNormalized = x;
            self.inputY1.frequencyNormalized = y;
    };
    
    [self.touchScreenView setTouchesBeganBlock:^(NSSet *touches, UIEvent *event) {
        _inputX1.muted = NO;
        _inputY1.muted = NO;
        renderAudioTouchEvent(touches, event);
    }];
    
    [self.touchScreenView setTouchesMovedBlock:^(NSSet *touches, UIEvent *event) {
        renderAudioTouchEvent(touches, event);
    }];
    
    [self.touchScreenView setTouchesEndedBlock:^(NSSet *touches, UIEvent *event) {
        _inputX1.muted = YES;
        _inputY1.muted = YES;
        renderAudioTouchEvent(touches, event);
    }];
    
    

}


@end
