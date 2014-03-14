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
@property (assign, nonatomic) BOOL decrementedOnce;
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
    whichPlayerLabel.text = @"Player X - BEGIN";
    self.exOrOh = @"X";
    self.gameState = 0;
    self.decrementedOnce = NO;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    NSLog(@"%d", self.gameState);
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    [self findLabelUsingPoint:point];
    
    if (self.gameState < 9)
    {
        if (self.gameState % 2 == 0)
        {
            self.exOrOh = @"O";
            whichPlayerLabel.textColor = [UIColor redColor];
            whichPlayerLabel.text = @"Player O";
        }
        else
        {
            self.exOrOh = @"X";
            whichPlayerLabel.textColor = [UIColor blueColor];
            whichPlayerLabel.text = @"Player X";
        }
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
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelOne.textColor = [UIColor blueColor]; }
                else
                {   myLabelOne.textColor = [UIColor redColor]; }
                myLabelOne.text = self.exOrOh;
            }
            else if (myLabelOne.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;
        
        if (CGRectContainsPoint(myLabelTwo.frame, point))
        {
            if (myLabelTwo.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelTwo.textColor = [UIColor blueColor]; }
                else
                {   myLabelTwo.textColor = [UIColor redColor]; }
                myLabelTwo.text = self.exOrOh;
            }
            else if (myLabelTwo.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;
        
        if (CGRectContainsPoint(myLabelThree.frame, point))
        {
            if (myLabelThree.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelThree.textColor = [UIColor blueColor]; }
                else
                {   myLabelThree.textColor = [UIColor redColor]; }
                myLabelThree.text = self.exOrOh;
            }
            else if (myLabelThree.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;
    
        if (CGRectContainsPoint(myLabelFour.frame, point))
        {
            if (myLabelFour.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelFour.textColor = [UIColor blueColor]; }
                else
                {   myLabelFour.textColor = [UIColor redColor]; }
                myLabelFour.text = self.exOrOh;
            }
            else if (myLabelFour.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;
    
        if (CGRectContainsPoint(myLabelFive.frame, point))
        {
            if (myLabelFive.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelFive.textColor = [UIColor blueColor]; }
                else
                {   myLabelFive.textColor = [UIColor redColor]; }
                myLabelFive.text = self.exOrOh;
            }
            else if (myLabelFive.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;

        if (CGRectContainsPoint(myLabelSix.frame, point))
        {
            if (myLabelSix.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelSix.textColor = [UIColor blueColor]; }
                else
                {   myLabelSix.textColor = [UIColor redColor]; }
                myLabelSix.text = self.exOrOh;
            }
            else if (myLabelSix.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;

        if (CGRectContainsPoint(myLabelSeven.frame, point))
        {
            if (myLabelSeven.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelSeven.textColor = [UIColor blueColor]; }
                else
                {   myLabelSeven.textColor = [UIColor redColor]; }
                myLabelSeven.text = self.exOrOh;
            }
            else if (myLabelSeven.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;
    
        if (CGRectContainsPoint(myLabelEight.frame, point))
        {
            if (myLabelEight.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelEight.textColor = [UIColor blueColor]; }
                else
                {   myLabelEight.textColor = [UIColor redColor]; }
                myLabelEight.text = self.exOrOh;
            }
            else if (myLabelEight.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;
    
        if (CGRectContainsPoint(myLabelNine.frame, point))
        {
            if (myLabelNine.text == nil)
            {
                if ([self.exOrOh  isEqual: @"X"])
                {   myLabelNine.textColor = [UIColor blueColor]; }
                else
                {   myLabelNine.textColor = [UIColor redColor]; }
                myLabelNine.text = self.exOrOh;
            }
            else if (myLabelNine.text != nil && self.decrementedOnce == NO)
            {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
        else self.decrementedOnce = NO;
        
    }
    else
    {
        whichPlayerLabel.textColor = [UIColor brownColor];
        whichPlayerLabel.text = @"IT'S A TIE";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
