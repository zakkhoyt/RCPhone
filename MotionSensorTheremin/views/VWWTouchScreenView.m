//
//  VWWTouchScreenView.m
//  MotionSensorTheremin
//
//  Created by Zakk Hoyt on 7/29/13.
//  Copyright (c) 2013 Zakk Hoyt. All rights reserved.
//

#import "VWWTouchScreenView.h"

@interface VWWTouchScreenView ()
@property (nonatomic, strong) VWWTouchScreenViewTouchesOccurred touchesBeganBlock;
@property (nonatomic, strong) VWWTouchScreenViewTouchesOccurred touchesMovedBlock;
@property (nonatomic, strong) VWWTouchScreenViewTouchesOccurred touchesEndedBlock;
@end

@implementation VWWTouchScreenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


#pragma mark UIResponder touch events
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.touchesBeganBlock){
        self.touchesBeganBlock(touches, event);
    }
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.touchesMovedBlock){
        self.touchesMovedBlock(touches, event);
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.touchesEndedBlock){
        self.touchesEndedBlock(touches, event);
    }
}


#pragma mark Public methods
-(void)setTouchesBeganBlock:(VWWTouchScreenViewTouchesOccurred)touchesBeganBlock
{
    _touchesBeganBlock = touchesBeganBlock;
}

-(void)setTouchesMovedBlock:(VWWTouchScreenViewTouchesOccurred)touchesMovedBlock
{
    _touchesMovedBlock = touchesMovedBlock;
}

-(void)setTouchesEndedBlock:(VWWTouchScreenViewTouchesOccurred)touchesEndedBlock
{
    _touchesEndedBlock = touchesEndedBlock;
}



@end
