//
//  VWWTouchScreenView.h
//  MotionSensorTheremin
//
//  Created by Zakk Hoyt on 7/29/13.
//  Copyright (c) 2013 Zakk Hoyt. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^VWWTouchScreenViewTouchesOccurred)(NSSet *touches, UIEvent *event);

@interface VWWTouchScreenView : UIView
-(void)setTouchesBeganBlock:(VWWTouchScreenViewTouchesOccurred)touchesBeganBlock;
-(void)setTouchesMovedBlock:(VWWTouchScreenViewTouchesOccurred)touchesMovedBlock;
-(void)setTouchesEndedBlock:(VWWTouchScreenViewTouchesOccurred)touchesEndedBlock;
@end
