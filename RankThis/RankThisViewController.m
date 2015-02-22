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
#import "AlternativeContainer.h"

@interface RankThisViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) NSArray *alternatives; //Of Alternative type
@property (strong, nonatomic) Question *question;
@property (strong, nonatomic) UIView *barContainer;
@property (strong, nonatomic) UIView *alternativeContainer;

@end

@implementation RankThisViewController


-(void)setUpLayout{


    _barContainer = [[BarContainer alloc]initWithFrame:CGRectMake(0, _gameView.frame.size.height * 0.1, _gameView.frame.size.width, _gameView.frame.size.height*0.5)
                                                       values:_alternatives];
    
    [_gameView addSubview:_barContainer];
    UITextView *questionView = [[UITextView alloc]initWithFrame:CGRectMake(0, 25, _gameView.frame.size.width, _barContainer.frame.origin.y)];
    
    questionView.editable = NO;
    questionView.font = [UIFont fontWithName:@"Helvetica" size:16];
    questionView.text = _question.questionString;
    questionView.backgroundColor = [UIColor lightGrayColor];
    [_gameView addSubview:questionView];
    
    CGRect containerFrame = CGRectMake(0, _gameView.frame.size.height*0.8, _gameView.frame.size.width, _gameView.frame.size.height*0.2);
    
    _alternativeContainer = [[AlternativeContainer alloc]initWithAlternatives:_alternatives frame:containerFrame];
    [_gameView addSubview:_alternativeContainer];
    


}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _question = [QnA_Factory getQuestion];
    _alternatives = [QnA_Factory getAlternativesforQuestion:_question nrOfAlternatives:[NSNumber numberWithInt:3]];
    
    [self setUpLayout];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
