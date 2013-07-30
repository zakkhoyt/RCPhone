//
//  VWWThereminSynthesizer.h
//  Theremin
//
//  Created by Zakk Hoyt on 7/29/12.
//  Copyright (c) 2012 Zakk Hoyt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>
#include "CAStreamBasicDescription.h"

@interface VWWThereminSynthesizer : NSObject

@property float                     amplitude;          // 0.0 - 1.0
@property bool                      muted;              // Y/N
@property (nonatomic) float         frequency;          // 30 - 22000
@property WaveType                  waveType;           // Enum
@property EffectType                effectType;         // Enum


@property double                    sinPhase;           // 0 - pi
@property double                    theta;              //

-(id)initWithAmplitude:(float)amplitude andFrequency:(float)frequency;
- (void)start;
- (void)stop;
@end
