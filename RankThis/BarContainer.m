//
//  BarContainer.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-21.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "BarContainer.h"


@implementation BarContainer


//Create bars and add them as subviews
-(void)createBars : (uint) nrOfBars {
    
    UIView *bar;
    CGRect frame;
    
    double barWidth = self.frame.size.width / 10.0;
    double distanceBetweenBars = self.frame.size.width / (nrOfBars+1.0);
    
    for (int i = 0; i < nrOfBars; i++) {
        
        frame = CGRectMake(((i+1) * distanceBetweenBars)- barWidth*0.5, self.frame.size.height-85, barWidth, 85);
        bar = [[UIView alloc] initWithFrame:frame];
        bar.backgroundColor = [UIColor redColor];
        [self addSubview:bar];
    }

}

- (id)initWithFrame:(CGRect)frame values : (NSArray*) valArray
{
    
    self = [self initWithFrame:frame];
    if (self) {
        
        [self createBars:[valArray count]];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
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
