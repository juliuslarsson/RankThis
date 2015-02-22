//
//  Alternative.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-22.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "Alternative.h"



@implementation Alternative


-(id)initWithName : (NSString*) name value : (NSNumber*) value question : (Question*) question{

    self = [super init];
    
    if (self) {
        _title = name;
        _value = value;
    }
    
    return  self;
}



@end
