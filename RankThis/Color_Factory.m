//
//  Color_Factory.m
//  RankThis
//
//  Created by Julius Larsson on 2015-04-08.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "Color_Factory.h"

@implementation Color_Factory


+(NSArray*)getColors : (NSUInteger)nrOfColors{
    
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:nrOfColors];
    UIColor *tempColor;
    for (int i = 0; i< nrOfColors; i++) {
        
        tempColor = [self getRandomColor];
        
        while ([colors containsObject:tempColor]) {
            tempColor = [self getRandomColor];
        }
        
        [colors addObject:tempColor];
    }
    
    return colors;

}

+(UIColor*)getRandomColor {
    
    uint randomIndex = arc4random_uniform(4);
    
    UIColor *randomColor;
    
    switch (randomIndex) {
        case 0:
            randomColor = [UIColor colorWithRed:(247/255.0) green:(129/255.0) blue:(129/255.0) alpha:1.0];
            break;
        case 1:
            randomColor = [UIColor colorWithRed:(242/255.0) green:(245/255.0) blue:(169/255.0) alpha:1.0];
            break;
        case 2:
            randomColor = [UIColor colorWithRed:(129/255.0) green:(129/255.0) blue:(247/255.0) alpha:1.0];
            break;
        case 3:
            randomColor = [UIColor colorWithRed:(223/255.0) green:(58/255.0) blue:(1/255.0) alpha:1.0];
            break;
            
        default:
            break;
    }
    
    return randomColor;

}

@end
