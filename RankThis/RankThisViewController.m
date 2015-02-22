//
//  RankThisViewController.m
//  RankThis
//
//  Created by Julius Larsson on 2015-02-21.
//  Copyright (c) 2015 Julius Larsson. All rights reserved.
//

#import "RankThisViewController.h"
#import "BarContainer.h"
#import "QnA_Factory.h"

@interface RankThisViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) NSArray *alternatives; //Of Alternative type
@property (strong, nonatomic) Question *question;

@end

@implementation RankThisViewController


-(void)setUpLayout{


    UIView *barContainer = [[BarContainer alloc]initWithFrame:CGRectMake(0, _gameView.frame.size.height * 0.2, _gameView.frame.size.width, 250)
                                                       values:_alternatives];
    
    [_gameView addSubview:barContainer];
    UITextView *questionView = [[UITextView alloc]initWithFrame:CGRectMake(0, 25, _gameView.frame.size.width, barContainer.frame.origin.y)];
    
    questionView.editable = NO;
    questionView.textColor = [UIColor blackColor];
    questionView.font = [UIFont fontWithName:@"Helvetica" size:16];
    questionView.text = _question.questionString;
    questionView.backgroundColor = [UIColor lightGrayColor];
    [_gameView addSubview:questionView];


}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _question = [QnA_Factory getQuestion];
    _alternatives = [QnA_Factory getAlternativesforQuestion:_question nrOfAlternatives:[NSNumber numberWithInt:4]];
    
    [self setUpLayout];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
