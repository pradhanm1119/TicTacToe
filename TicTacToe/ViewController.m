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
//@property (strong, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    BOOL gameStarted = NO;
    whichPlayerLabel.text = @"X";
    
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    [self findLabelUsingPoint:point];
    
    if (gameStarted == NO)
    {
        whichPlayerLabel.text = @"O";
        
    }
}

- (void)findLabelUsingPoint:(CGPoint)point
{
    // Tic Tac Toe Grid
    if (CGRectContainsPoint(myLabelOne.frame, point))
    {
        NSLog(@"Label One");
    }
    if (CGRectContainsPoint(myLabelTwo.frame, point))
    {
        NSLog(@"Label Two");
    }
    if (CGRectContainsPoint(myLabelThree.frame, point))
    {
        NSLog(@"Label Three");
    }
    if (CGRectContainsPoint(myLabelFour.frame, point))
    {
        NSLog(@"Label Four");
    }
    if (CGRectContainsPoint(myLabelFive.frame, point))
    {
        NSLog(@"Label Five");
    }
    if (CGRectContainsPoint(myLabelSix.frame, point))
    {
        NSLog(@"Label Six");
    }
    if (CGRectContainsPoint(myLabelSeven.frame, point))
    {
        NSLog(@"Label Seven");
    }
    if (CGRectContainsPoint(myLabelEight.frame, point))
    {
        NSLog(@"Label Eight");
    }
    if (CGRectContainsPoint(myLabelNine.frame, point))
    {
        NSLog(@"Label Nine");
    }
    
    // Player turn
    if (CGRectContainsPoint(whichPlayerLabel.frame, point))
    {
        NSLog(@"Which player?");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
