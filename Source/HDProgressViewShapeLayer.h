//
//  HDProgressView.h
//  HaidoraProgressView
//
//  Created by DaiLingchi on 15-1-23.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "HDProgressView.h"

@import UIKit;
@import Foundation;

@interface HDProgressViewShapeLayer : CAShapeLayer

/**
 *  gradient
 */
@property (nonatomic, strong) NSArray *progressColors;

@property (nonatomic, assign) CGFloat precent;
@property (nonatomic, assign) HDProgressViewPositionn startPosition;

@end
