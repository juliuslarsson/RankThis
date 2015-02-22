//
//  Question.h
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alternative.h"

@interface Question : NSObject

@property (strong, nonatomic) NSString *questionString;
@property (strong, nonatomic) NSArray *alternatives; // of Alternative type.



@end
