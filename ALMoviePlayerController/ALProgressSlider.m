//
//  IALProgressSlider.m
//  ALMoviePlayerController
//
//  Created by Iftekhar Qurashi on 06/01/15.
//  Copyright (c) 2015 Anthony Lobianco. All rights reserved.
//

#import "ALProgressSlider.h"

@implementation ALProgressSlider

-(void)_initialize
{
    _playableProgress = 1.0;
    [self setNeedsDisplay];

    [self setMaximumTrackTintColor:[UIColor clearColor]];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self _initialize];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self _initialize];
}

- (CGRect)trackRectForBounds:(CGRect)bounds
{
    CGRect rect = [super trackRectForBounds:bounds];
    
    rect = CGRectInset(rect, 0, -0.5);
    
    return rect;
}

-(void)setPlayableProgress:(CGFloat)playableProgress
{
    if (_playableProgress != playableProgress)
    {
        _playableProgress = playableProgress;
        [self setNeedsDisplay];
    }
}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setNeedsDisplay];
}

-(void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef c = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGRect r = [self trackRectForBounds:self.bounds];
    r = CGRectInset(r, 0.5, 0.5);
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:r cornerRadius:r.size.height/2.0];
    CGContextAddPath(c, bezierPath.CGPath);
    CGContextSetLineWidth(c, 1);
    CGContextStrokePath(c);
    CGContextAddPath(c, bezierPath.CGPath);
    CGContextClip(c);
    CGContextFillRect(c, CGRectMake(r.origin.x, r.origin.y, r.size.width * _playableProgress, r.size.height));
}


@end
