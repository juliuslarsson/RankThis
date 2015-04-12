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
#import "AppSettings.h"
#import "DragableView.h"
#import "BarView.h"

@interface RankThisViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) NSArray *alternatives; //Of Alternative type
@property (strong, nonatomic) Question *question;
@property (strong, nonatomic) BarContainer *barContainer;
@property (strong, nonatomic) UIView *alternativeContainer;

@end

@implementation RankThisViewController


-(void)onPanEnded : (NSNotification *) notification{
    
    UITouch *touch = [notification.userInfo objectForKey:TOUCH];
    CGPoint point = [touch locationInView:_barContainer];
    
    
    DragableView *sender = notification.object;
    
    for (BarView *view in [_barContainer getBars]){
    
        if (point.x > view.frame.origin.x && point.x < view.frame.origin.x + view.frame.size.width &&
            point.y > view.frame.origin.y && point.y < view.frame.origin.y + view.frame.size.height) {
            
            sender.hidden = YES;
            view.backgroundColor = sender.backgroundColor;
            view.label.text = sender.label.text;
            
        }else{
            
            [UIView animateWithDuration:0.2
                             animations:^{
                                 sender.frame = sender.originalFrame;
                             }
                             completion:^(BOOL finished) {
                                 sender.label.alpha = 1.0;
                             }];
        
        
        }
    }
}

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
    _alternatives = [QnA_Factory getAlternativesforQuestion:_question nrOfAlternatives:[NSNumber numberWithInt:4]];
    
    [self setUpLayout];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(onPanEnded:)
                                                name:PAN_ENDED
                                              object:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
