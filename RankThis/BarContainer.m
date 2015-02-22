//
//  BarContainer.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-21.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "BarContainer.h"
#import "Alternative.h"

@interface BarContainer ()

@property (strong, nonatomic) NSArray *alternatives;

@end

@implementation BarContainer

//Create bars and add them as subviews
-(void)createBars : (uint) nrOfBars {
    
    int largestValue = 0;
    
    //Find  the largest value
    for (Alternative *alt in _alternatives)
        if(alt.value.intValue > largestValue)
            largestValue = alt.value.intValue;
    
    UIView *bar;
    CGRect frame;
    Alternative *tempAlt;
    
    double barWidth = self.frame.size.width / 10.0;
    double distanceBetweenBars = self.frame.size.width / (nrOfBars+1.0);
    double height;
    
    for (int i = 0; i < nrOfBars; i++) {
        
        tempAlt = [_alternatives objectAtIndex:i];
        height = (tempAlt.value.doubleValue / largestValue) *0.75 * self.frame.size.height;
        
        frame = CGRectMake(((i+1) * distanceBetweenBars)- barWidth*0.5, self.frame.size.height-height, barWidth, height);
        bar = [[UIView alloc] initWithFrame:frame];
        bar.backgroundColor = [UIColor blueColor];
        //bar.layer.cornerRadius = 5.0;
        [self addValueLabel:tempAlt.value.stringValue aboveFrame:bar.frame];
        [self addSubview:bar];
    }

}

-(void)addValueLabel : (NSString*) labelString aboveFrame : (CGRect)frame{

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y - 30, frame.size.width, 25)];
    label.text = labelString;
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:label];
    

}

- (id)initWithFrame:(CGRect)frame values : (NSArray*) valArray
{
    
    self = [self initWithFrame:frame];
    if (self) {
        
        _alternatives = valArray;
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
