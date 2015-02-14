//
//  HDProgressView.m
//  HaidoraProgressView
//
//  Created by DaiLingchi on 15-1-23.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "HDProgressView.h"
#import "HDProgressViewShapeLayer.h"

@interface HDProgressView ()

@property (nonatomic, strong) HDProgressViewShapeLayer *progressLayer;

@end

@implementation HDProgressView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.progressLayer = [[HDProgressViewShapeLayer alloc] init];
    [self.layer addSublayer:self.progressLayer];

    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = NO;
    self.precent = 0;
    self.startPosition = HDProgressViewPositionnTop;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.progressLayer.frame = self.bounds;
}

#pragma mark
#pragma mark Setter

- (void)setPrecent:(CGFloat)precent
{
    _precent = MIN(MAX(0, precent), 1);
    self.progressLayer.precent = _precent;
}

- (void)setStartPosition:(HDProgressViewPositionn)startPosition
{
    _startPosition = startPosition;
    self.progressLayer.startPosition = startPosition;
}

- (void)setProgressColors:(NSArray *)progressColors
{
    _progressColors = progressColors;
    self.progressLayer.progressColors = progressColors;
}

@end
