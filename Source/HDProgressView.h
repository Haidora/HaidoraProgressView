//
//  HDProgressView.h
//  HaidoraProgressView
//
//  Created by DaiLingchi on 15-1-23.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HDProgressViewPositionn)
{
    HDProgressViewPositionnTop = 0,
    HDProgressViewPositionnBottom,
    HDProgressViewPositionnLeft,
    HDProgressViewPositionnRight
};

/**
 *  HDProgressView
 */
@interface HDProgressView : UIView

@property (nonatomic, assign) CGFloat precent;
/**
 *  the progress start position
 */
@property (nonatomic, assign) HDProgressViewPositionn startPosition;
/**
 *  the progressview gradientColors
 */
@property (nonatomic, strong) NSArray *progressColors;

@end
