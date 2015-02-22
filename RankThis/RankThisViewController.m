//
//  RankThisViewController.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-21.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "RankThisViewController.h"
#import "BarContainer.h"

@interface RankThisViewController ()
@property (weak, nonatomic) IBOutlet UIView *gameView;

@end

@implementation RankThisViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSArray *testArray = [NSArray arrayWithObjects:[NSNumber numberWithInt:5],[NSNumber numberWithInt:5], nil ];
    UIView *barContainer = [[BarContainer alloc]initWithFrame:CGRectMake(10, 10, 100, 100) values:testArray];
    
    [self.view addSubview:barContainer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
