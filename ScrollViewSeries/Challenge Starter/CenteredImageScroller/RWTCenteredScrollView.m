//
//  RWTCenteredScrollView.m
//  CenteredImageScroller
//
//  Created by Main Account on 4/26/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTCenteredScrollView.h"

@interface RWTCenteredScrollView()
@property (nonatomic,assign) BOOL firstTime;
@property (nonatomic,assign) CGSize oldSize;
@property (nonatomic,assign) CGPoint oldCenterPoint;


@end


@implementation RWTCenteredScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.firstTime = YES;
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.firstTime) {
        [self setZoomScales];
    }
    [self centerContent];
    if (self.firstTime) {
        self.firstTime = FALSE;
    }
    else if(!CGSizeEqualToSize(self.bounds.size, self.oldSize)){
        [self adjustInnerView];
        self.oldSize = self.bounds.size;
    }
    self.oldCenterPoint = [self centerPoint];
}

- (void)centerContent {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewForZoomingInScrollView:)]) {
        
        UIView *viewToCenter = [self.delegate viewForZoomingInScrollView:self];
        
        CGSize boundsSize = self.bounds.size;
        CGRect frameToCenter = viewToCenter.frame;
        
        if (frameToCenter.size.width < boundsSize.width) {
            frameToCenter.origin.x =(boundsSize.width - frameToCenter.size.width) / 2;
        } else {
            frameToCenter.origin.x = 0;
        }
        
        if (frameToCenter.size.height < boundsSize.height) {
            frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
        } else {
            frameToCenter.origin.y = 0;
        }
        
        viewToCenter.frame = frameToCenter;
        
    }
    
}
- (void)setZoomScales {
    if ([self.delegate respondsToSelector:@selector(viewForZoomingInScrollView:)]) {
        UIView *viewToCenter = [self.delegate viewForZoomingInScrollView:self];
        
        CGSize boundsSize = self.bounds.size;
        CGSize imageSize = viewToCenter.bounds.size;
        
        CGFloat xScale = boundsSize.width / imageSize.width;
        CGFloat yScale = boundsSize.height / imageSize.height;
        CGFloat minScale = MIN(xScale, yScale);
        
        self.minimumZoomScale = minScale;
        self.zoomScale = minScale;
        self.maximumZoomScale = 3.0;
    }
}

-(CGPoint)centerPoint{
    if ([self.delegate respondsToSelector:@selector(viewForZoomingInScrollView:)]) {
        UIView *viewToCenter = [self.delegate viewForZoomingInScrollView:self];
        CGPoint scrollViewCenter = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
        CGPoint imageCenter = [self convertPoint:scrollViewCenter toView:viewToCenter];
        return  imageCenter;
        
    }
    return CGPointZero;
}

-(void)adjustInnerView{
    if ([self.delegate respondsToSelector:@selector(viewForZoomingInScrollView:)]) {
        UIView *innerView = [self.delegate viewForZoomingInScrollView:self];
        CGPoint desiredCenter = [innerView convertPoint:self.oldCenterPoint toView:self];
        
        CGPoint actualCenter = CGPointMake(CGRectGetMidX(self.bounds),CGRectGetMidY(self.bounds));
        CGPoint contentOffset = [self contentOffset];
        contentOffset.x += desiredCenter.x - actualCenter.x;
        contentOffset.y += desiredCenter.y  - actualCenter.y;
        self.contentOffset = contentOffset;
    }
    
}


@end
