//
//  Color_Factory.h
//  RankThis
//
//  Created by Julius Larsson on 2015-04-08.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Color_Factory : NSObject

+(NSArray*)getColors : (NSUInteger)nrOfColors;
+(UIColor*)getRandomColor;

@end
