//
//  DragableView.h
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DragableView : UIView

@property CGRect originalFrame;

- (id)initWithTitle: (NSString*)title color : (UIColor*)color frame : (CGRect)frame;
@property (strong, nonatomic) UILabel *label;

@end
