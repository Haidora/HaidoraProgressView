//
//  ViewController.m
//  HaidoraProgressView
//
//  Created by DaiLingchi on 15-1-23.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "ViewController.h"
#import "HaidoraProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HDProgressView *progressView;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.progressView.precent = 0.5;
    // Do any additional setup after loading the view, typically from a nib.
    //    _timer = [NSTimer timerWithTimeInterval:3
    //                                     target:self
    //                                   selector:@selector(tick)
    //                                   userInfo:nil
    //                                    repeats:YES];
    //    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
}

- (void)tick
{
    //    CGFloat prece = (arc4random() % 10) / 10.0;
    //    self.progressView.precent = prece;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
