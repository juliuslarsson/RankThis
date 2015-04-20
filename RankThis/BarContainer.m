//
//  BarContainer.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-21.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "BarContainer.h"
#import "Alternative.h"
#import "BarView.h"

@interface BarContainer ()

@property (strong, nonatomic) NSArray *alternatives;
@property (strong, nonatomic) NSMutableArray *bars;


@end

@implementation BarContainer

//Create bars and add them as subviews
-(void)createBars : (uint) nrOfBars {
    
    int largestValue = 0;
    _bars = [[NSMutableArray alloc]init];
    
    //Find  the largest value
    for (Alternative *alt in _alternatives)
        if(alt.value.intValue > largestValue)
            largestValue = alt.value.intValue;
    
    BarView *bar;
    CGRect frame;
    Alternative *tempAlt;
    
    double barWidth = self.frame.size.width / 10.0;
    double distanceBetweenBars = self.frame.size.width / (nrOfBars+1.0);
    double height;
    
    for (int i = 0; i < nrOfBars; i++) {
        
        tempAlt = [_alternatives objectAtIndex:i];
        height = (tempAlt.value.doubleValue / largestValue) *0.75 * self.frame.size.height + 5.0; //+5 to hide bottom corner
        
        frame = CGRectMake(((i+1) * distanceBetweenBars)- barWidth*0.5, self.frame.size.height-height+5, barWidth, height);
        bar = [[BarView alloc] initWithFrame:frame];
        bar.backgroundColor = [UIColor darkGrayColor];
        bar.layer.cornerRadius = 5.0;
        [self addValueLabel:tempAlt.value.stringValue aboveFrame:bar.frame];
        [self addDesctiptiveLabelForBar:bar];
        [_bars addObject:bar];
        [self addSubview:bar];
    }

}

-(NSArray*)getBars{

    NSMutableArray *bars = [[NSMutableArray alloc]init];
    
    for (UIView *view in self.subviews)
        if([view isKindOfClass:[BarView class]])
           [bars addObject:view];
    
    return bars;
}

-(void)addValueLabel : (NSString*) labelString aboveFrame : (CGRect)frame{


    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y - 30, frame.size.width, 25)];
    label.text = labelString;
    label.textAlignment = NSTextAlignmentCenter;
    label.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:label];
}


-(void)addDesctiptiveLabelForBar : (BarView*) bar {
    
    double width = self.frame.size.width / [_alternatives count];

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(bar.frame.origin.x, self.frame.size.height, width, 40)];
    
    //label.adjustsFontSizeToFitWidth = YES;
    bar.label = label;
    label.transform = CGAffineTransformMakeRotation(-0.3);
    
    [self addSubview:label];

}

- (id)initWithFrame:(CGRect)frame values : (NSArray*) valArray
{
    
    self = [self initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        _alternatives = valArray;
        [self createBars:[valArray count]];
        self.backgroundColor = [UIColor lightGrayColor];
        _bars = [[NSMutableArray alloc]init];
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
