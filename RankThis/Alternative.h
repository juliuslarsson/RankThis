//
//  Alternative.h
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@class Question;

@interface Alternative : NSObject


@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSNumber *value;
@property (strong, nonatomic) Question *question;

-(id)initWithName : (NSString*) name value : (NSNumber*) value question : (Question*) question;


@end
