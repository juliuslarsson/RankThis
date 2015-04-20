//
//  BarView.h
//  RankThis
//
//  Created by Julius Larsson on 2015-02-27.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BarView : UIView

-(void)animateResizing;
@property (strong, nonatomic) UILabel *label;

@end
