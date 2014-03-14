//
//  ViewController.m
//  TicTacToe
//
//  Created by Manas Pradhan on 3/13/14.
//  Copyright (c) 2014 Manas Pradhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    IBOutlet UILabel *myLabelOne;
    IBOutlet UILabel *myLabelTwo;
    IBOutlet UILabel *myLabelThree;
    IBOutlet UILabel *myLabelFour;
    IBOutlet UILabel *myLabelFive;
    IBOutlet UILabel *myLabelSix;
    IBOutlet UILabel *myLabelSeven;
    IBOutlet UILabel *myLabelEight;
    IBOutlet UILabel *myLabelNine;
    IBOutlet UILabel *whichPlayerLabel;
}
@property (weak, nonatomic) NSString *exOrOh;
@property (assign, nonatomic) NSInteger gameState;
@property (assign, nonatomic) BOOL newGame;
@property (strong, nonatomic) IBOutlet UIImageView *ticTacToeBoard;

//@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
	[self initialize];
}

- (void)initialize
{
    myLabelOne.text = nil;
    myLabelTwo.text = nil;
    myLabelThree.text = nil;
    myLabelFour.text = nil;
    myLabelFive.text = nil;
    myLabelSix.text = nil;
    myLabelSeven.text = nil;
    myLabelEight.text = nil;
    myLabelNine.text = nil;
    whichPlayerLabel.text = @"Player 1 - BEGIN";
    self.exOrOh = @"X";
    self.gameState = 0;
    self.newGame = YES;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSLog(@"%d", self.gameState);
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    [self findLabelUsingPoint:point];
    
    if (self.gameState % 2 == 0)
    {
        self.exOrOh = @"O";
        whichPlayerLabel.text = @"Player 2's Turn (O)";
    }
    else
    {
        self.exOrOh = @"X";
        whichPlayerLabel.text = @"Player 1's Turn (X)";
    }
    
    ++self.gameState;
}

- (void)findLabelUsingPoint:(CGPoint)point
{
    if (self.gameState < 9)
    {
        // Tic Tac Toe Grid
        if (CGRectContainsPoint(myLabelOne.frame, point))
        {
            if (myLabelOne.text == nil)
                myLabelOne.text = self.exOrOh;
        }
        
        if (CGRectContainsPoint(myLabelTwo.frame, point))
        {
            if (myLabelTwo.text == nil)
                myLabelTwo.text = self.exOrOh;
        }
        
        if (CGRectContainsPoint(myLabelThree.frame, point))
        {
            if (myLabelThree.text == nil)
                myLabelThree.text = self.exOrOh;
        }
    
        if (CGRectContainsPoint(myLabelFour.frame, point))
        {
            if (myLabelFour.text == nil)
                myLabelFour.text = self.exOrOh;
        }
    
        if (CGRectContainsPoint(myLabelFive.frame, point))
        {
            if (myLabelFive.text == nil)
                myLabelFive.text = self.exOrOh;
        }

        if (CGRectContainsPoint(myLabelSix.frame, point))
        {
            if (myLabelSix.text == nil)
                myLabelSix.text = self.exOrOh;
        }

        if (CGRectContainsPoint(myLabelSeven.frame, point))
        {
            if (myLabelSeven.text == nil)
                myLabelSeven.text = self.exOrOh;
        }
    
        if (CGRectContainsPoint(myLabelEight.frame, point))
        {
            if (myLabelEight.text == nil)
                myLabelEight.text = self.exOrOh;
        }
    
        if (CGRectContainsPoint(myLabelNine.frame, point))
        {
            if (myLabelNine.text == nil)
                myLabelNine.text = self.exOrOh;
        }
        
    }
    else
        NSLog(@"GAME OVER");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
