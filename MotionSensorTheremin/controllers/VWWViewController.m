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

@property (nonatomic, strong) VWWThereminInput *inputX2;
@property (nonatomic, strong) VWWThereminInput *inputY2;
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
    _inputX2 = [[VWWThereminInput alloc]init];
    _inputY2 = [[VWWThereminInput alloc]init];
}

-(void)configureTouchScreenView
{
    void (^renderTouchEvent)(NSSet *touches, UIEvent *event) = ^(NSSet *touches, UIEvent *event) {
        NSArray *touchesArray = [touches allObjects];
        if(touchesArray.count == 2){

            UITouch *touch1 = touchesArray[0];
            CGPoint point1 = [touch1 locationInView:self.touchScreenView];
            float x1 = point1.x / (float)self.touchScreenView.frame.size.width;
            float y1 = 1.0 - (point1.y / (float)self.touchScreenView.frame.size.height);
            self.inputX1.frequencyNormalized = x1;
            self.inputY1.frequencyNormalized = y1;
            
            UITouch *touch2 = touchesArray[1];
            CGPoint point2 = [touch2 locationInView:self.touchScreenView];
            float x2 = point2.x / (float)self.touchScreenView.frame.size.width;
            float y2 = 1.0 - (point2.y / (float)self.touchScreenView.frame.size.height);
            self.inputX2.frequencyNormalized = x2;
            self.inputY2.frequencyNormalized = y2;

            
        }
        else{
            UITouch *touch = touchesArray[0];
            CGPoint point = [touch locationInView:self.touchScreenView];
            float x = point.x / (float)self.touchScreenView.frame.size.width;
            float y = 1.0 - (point.y / (float)self.touchScreenView.frame.size.height);
            self.inputX1.frequencyNormalized = x;
            self.inputY1.frequencyNormalized = y;
        }
        
//        }
//        UITouch* touch = touchesArray[0];
//        CGPoint point = [touch locationInView:self.touchScreenView];
//        float x = point.x / (float)self.touchScreenView.frame.size.width;
//        float y = 1.0 - (point.y / (float)self.touchScreenView.frame.size.height);
////        NSLog(@"%s: %f %f", __FUNCTION__, x, y);
//        
//        self.inputX.frequencyNormalized = x;
//        self.inputY.frequencyNormalized = y;
    };
    
    [self.touchScreenView setTouchesBeganBlock:^(NSSet *touches, UIEvent *event) {
        _inputX1.muted = NO;
        _inputY1.muted = NO;
        if(touches.count > 1){
            _inputX2.muted = NO;
            _inputY2.muted = NO;
        }
        renderTouchEvent(touches, event);
    }];
    
    [self.touchScreenView setTouchesMovedBlock:^(NSSet *touches, UIEvent *event) {
        renderTouchEvent(touches, event);
    }];
    
    [self.touchScreenView setTouchesEndedBlock:^(NSSet *touches, UIEvent *event) {
        _inputX1.muted = YES;
        _inputY1.muted = YES;
        _inputX2.muted = YES;
        _inputY2.muted = YES;
        renderTouchEvent(touches, event);
    }];
    
    

}


@end
