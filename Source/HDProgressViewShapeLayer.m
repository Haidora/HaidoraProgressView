//
//  HDProgressView.m
//  HaidoraProgressView
//
//  Created by DaiLingchi on 15-1-23.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "HDProgressViewShapeLayer.h"

static NSInteger hdProgressMargin = 10;

@interface HDProgressViewShapeLayer ()

@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAGradientLayer *progressGradientLayer;

@end

@implementation HDProgressViewShapeLayer

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    // config
    self.progressColors = @[
        (id)[[UIColor colorWithRed:0.238 green:0.636 blue:0.940 alpha:1.000] CGColor],
        (id)[[UIColor colorWithRed:0.325 green:0.894 blue:0.416 alpha:1.000] CGColor]
    ];

    self.backgroundColor = [UIColor clearColor].CGColor;
    self.fillColor = [UIColor clearColor].CGColor;
    self.strokeColor = [UIColor colorWithRed:0.86f green:0.86f blue:0.86f alpha:0.4f].CGColor;

    // progress
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeColor =
        [UIColor colorWithRed:0.238 green:0.636 blue:0.940 alpha:1.000].CGColor;
    self.progressLayer.lineWidth = self.lineWidth - hdProgressMargin;
    self.progressLayer.lineCap = kCALineCapRound;
    self.progressLayer.lineJoin = kCALineCapRound;
    [self addSublayer:self.progressLayer];

    // gradient
    //    self.progressGradientLayer = [CAGradientLayer layer];
    //    self.progressGradientLayer.colors = self.progressColors;
    //    [self addSublayer:self.progressGradientLayer];
    //    [self.progressGradientLayer setMask:self.progressLayer];
}

- (void)layoutSublayers
{
    [super layoutSublayers];

    CGFloat width = CGRectGetWidth(self.bounds);
    CGFloat height = CGRectGetHeight(self.bounds);
    if (self.lineWidth == 1)
    {
        self.lineWidth = MIN(width, height) / 5;
        self.progressLayer.lineWidth = self.lineWidth - 10;
    }

    self.path = [self drawPathWithArcCenter];
    self.progressLayer.path = [self drawPathWithArcCenterWithPosition];

    self.progressLayer.frame = self.bounds;
    self.progressGradientLayer.frame = self.bounds;
}

#pragma mark
#pragma mark Setter

- (void)setPrecent:(CGFloat)precent
{
    _precent = MIN(MAX(0, precent), 1);

    // set progress
    self.progressLayer.strokeEnd = _precent;
    [self startAnimation];
}

- (void)setStartPosition:(HDProgressViewPositionn)startPosition
{
    _startPosition = startPosition;
    CGPoint startPoint = CGPointMake(0.5, 0);
    CGPoint endPoint = CGPointMake(0.5, 1);
    switch (startPosition)
    {
    case HDProgressViewPositionnTop:
    {
        startPoint = CGPointMake(0.5, 0);
        endPoint = CGPointMake(0.5, 1);
    }
    break;
    case HDProgressViewPositionnBottom:
    {
        startPoint = CGPointMake(0.5, 1);
        endPoint = CGPointMake(0.5, 0);
    }
    break;
    case HDProgressViewPositionnLeft:
    {
        startPoint = CGPointMake(0, 0.5);
        endPoint = CGPointMake(1, 0.5);
    }
    break;

    case HDProgressViewPositionnRight:
    {
        startPoint = CGPointMake(0.5, 1);
        endPoint = CGPointMake(0.5, 0);
    }
    break;
    default:
        break;
    }
    self.progressGradientLayer.startPoint = startPoint;
    self.progressGradientLayer.endPoint = endPoint;
}

- (void)setProgressColors:(NSArray *)progressColors
{
    _progressColors = progressColors;
    self.progressGradientLayer.colors = _progressColors;
}

#pragma mark
#pragma mark Private Method

- (CGPathRef)drawPathWithArcCenter
{
    CGFloat position_x = CGRectGetWidth(self.bounds) / 2;
    CGFloat position_y = CGRectGetHeight(self.bounds) / 2;
    CGFloat radius = MIN(position_x, position_y) - self.lineWidth / 2;
    // generate Arc
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(position_x, position_y)
                                          radius:radius
                                      startAngle:0
                                        endAngle:2 * M_PI
                                       clockwise:YES].CGPath;
}

- (CGPathRef)drawPathWithArcCenterWithPosition
{
    CGFloat position_x = CGRectGetWidth(self.bounds) / 2;
    CGFloat position_y = CGRectGetHeight(self.bounds) / 2;
    CGFloat radius = MIN(position_x, position_y) - self.lineWidth / 2;
    CGFloat startAngle = 0;
    CGFloat endAngle = 0;

    switch (self.startPosition)
    {
    case HDProgressViewPositionnTop:
    {
        startAngle = 3 * M_PI_2;
        endAngle = 7 * M_PI_2;
    }
    break;
    case HDProgressViewPositionnBottom:
    {
        startAngle = M_PI_2;
        endAngle = 5 * M_PI_2;
    }
    break;
    case HDProgressViewPositionnLeft:
    {
        startAngle = 2 * M_PI_2;
        endAngle = 6 * M_PI_2;
    }
    break;
    case HDProgressViewPositionnRight:
    {
        startAngle = 0;
        endAngle = 3 * M_PI_2;
    }
    break;

    default:
        break;
    }
    // generate Arc
    return [UIBezierPath bezierPathWithArcCenter:CGPointMake(position_x, position_y)
                                          radius:radius
                                      startAngle:startAngle
                                        endAngle:endAngle
                                       clockwise:YES].CGPath;
}

- (void)startAnimation
{
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokenEnd"];
    pathAnimation.duration = 1.0;
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(self.precent);
    pathAnimation.removedOnCompletion = YES;

    [self.progressLayer addAnimation:pathAnimation forKey:nil];
}

@end
