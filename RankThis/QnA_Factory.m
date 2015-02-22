//
//  QnA_Factory.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "QnA_Factory.h"

@implementation QnA_Factory

+(Question*)getQuestion{
    
    Question *q = [[Question alloc]init];
    q.questionString = @"Hur många miljoner innvånare har landet?";
    
    return q;

}

+(NSArray*)getAlternativesforQuestion : (Question*)question nrOfAlternatives :(NSNumber*)nrOfAlternatives{

    NSMutableArray *alternatives = [[NSMutableArray alloc]init];

    
    if ([question.questionString isEqualToString:@"Hur många miljoner innvånare har landet?"]) {
        
        
        [alternatives addObject:[[Alternative alloc]initWithName:@"Sverige"
                                                           value:[NSNumber numberWithInt:10]
                                                        question:question]];
        
        [alternatives addObject:[[Alternative alloc]initWithName:@"Norge"
                                                           value:[NSNumber numberWithInt:5]
                                                        question:question]];
        
        [alternatives addObject:[[Alternative alloc]initWithName:@"Ghana"
                                                           value:[NSNumber numberWithInt:26]
                                                        question:question]];
        
        [alternatives addObject:[[Alternative alloc]initWithName:@"Spanien"
                                                           value:[NSNumber numberWithInt:48]
                                                        question:question]];
        
        [alternatives addObject:[[Alternative alloc]initWithName:@"Japan"
                                                           value:[NSNumber numberWithInt:127]
                                                        question:question]];
    }
    
    
    
    NSRange range = NSMakeRange(0, 5-nrOfAlternatives.intValue);
    [alternatives removeObjectsInRange:range];
    

    return alternatives;

}

@end
