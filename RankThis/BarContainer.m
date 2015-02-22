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
    
    int barWidth = self.frame.size.width / 10;
    int distanceBetweenBars = (self.frame.size.width - (barWidth * nrOfBars)) / nrOfBars+1;

    for (int i = 0; i < nrOfBars; i++) {
        
        
        frame = CGRectMake((i+1) * distanceBetweenBars, self.frame.size.height-25, barWidth, 25);
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
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
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
