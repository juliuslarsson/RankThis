//
//  BarView.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-27.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "BarView.h"

#define RESIZE 4.0

@implementation BarView


-(void)animateResizing{
    
    CGRect originalFrame = self.frame;
    
    [UIView animateWithDuration:0.15
                     animations:^{
                         self.frame = CGRectMake(originalFrame.origin.x-(RESIZE/2.0),
                                                 originalFrame.origin.y-(RESIZE/2.0),
                                                 originalFrame.size.width + RESIZE,
                                                 originalFrame.size.height + RESIZE);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.15 animations:^{
                             self.frame = originalFrame;
                         }];
                     }];
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //init
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

@end
