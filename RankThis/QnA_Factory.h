//
//  QnA_Factory.h
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"
#import "Alternative.h"

@interface QnA_Factory : NSObject


+(NSArray*)getAlternatives;

@end
