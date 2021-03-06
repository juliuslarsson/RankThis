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


//This class is used for testing purposes only.
@interface QnA_Factory : NSObject


+(NSArray*)getAlternativesforQuestion : (Question*)question nrOfAlternatives :(NSNumber*)nrOfAlternatives;
+(Question*)getQuestion;

@end
