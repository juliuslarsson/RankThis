//
//  AlternativeContainer.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "AlternativeContainer.h"
#import "Alternative.h"
#import "DragableView.h"
#import "Color_Factory.h"

@interface AlternativeContainer ()

@property (strong, nonatomic) NSArray *alternatives;
@property (strong, nonatomic) NSMutableArray *altViews;

@end

@implementation AlternativeContainer


-(void)addAlternatives{
    
    float height = self.frame.size.height/ [_alternatives count];
    Alternative *tempAlt;
    
    CGRect frame;
    
    NSArray *colors = [Color_Factory getColors:[_alternatives count]];
    
    for (int i = 0; i < [_alternatives count]; i++) {
        
        frame = CGRectMake(0, i*height, self.frame.size.width, height);
        
        tempAlt = [_alternatives objectAtIndex:i];
        DragableView *dragView = [[DragableView alloc]initWithTitle:tempAlt.title
                                                              color:[colors objectAtIndex:i]
                                                              frame:frame];
        
        dragView.layer.borderColor = [UIColor blackColor].CGColor;
        dragView.layer.borderWidth = 1.0;
        
        [self addSubview:dragView];
    }
}

- (id)initWithAlternatives : (NSArray*)alternatives frame :(CGRect)frame{

    self = [super initWithFrame:frame];

    if (self) {
        
        _alternatives = alternatives;
        [self addAlternatives];
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
