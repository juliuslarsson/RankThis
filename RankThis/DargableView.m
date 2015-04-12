//
//  DragableView.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "DragableView.h"
#import "AppSettings.h"
#import "Color_Factory.h"

@interface DragableView ()

@property (strong, nonatomic) NSMutableArray *bars;


@end

@implementation DragableView


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint pointOfTouch = [touch locationInView:self.superview];
    
    _originalFrame = self.frame;

    [UIView animateWithDuration:0.2
                     animations:^{
        
                         self.frame = CGRectMake(pointOfTouch.x - 12 , pointOfTouch.y - 12, 24, 24);
    
                     }];
    
    _label.alpha = 0.0;

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    CGPoint pointOfTouch = [touch locationInView:self.superview];
    
    self.frame = CGRectMake(pointOfTouch.x - 12 , pointOfTouch.y - 12, 24, 24);

}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{

    UITouch *touch = [touches anyObject];
    NSNotification *panEnded = [NSNotification notificationWithName:PAN_ENDED
                                                             object:self
                                                           userInfo:@{TOUCH: touch}];
    
    [[NSNotificationCenter defaultCenter] postNotification:panEnded];
}

- (id)initWithTitle: (NSString*)title color : (UIColor*)color frame : (CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = color;
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        
        _label = label;
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
