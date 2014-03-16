//
//  ViewController.m
//  TicTacToe
//
//  Created by Manas Pradhan on 3/13/14.
//  Copyright (c) 2014 Manas Pradhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate, UIActionSheetDelegate>
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
    //IBOutlet UILabel *winner;
}
@property (weak, nonatomic) NSString *playerTurn;
@property (assign, nonatomic) NSInteger gameState;
@property (assign, nonatomic) BOOL decrementedOnce;
@property (assign, nonatomic) BOOL gameOver;
@property (strong, nonatomic) IBOutlet UIImageView *ticTacToeBoard;

@end

UIAlertView *av;

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
    
    self.playerTurn = @"X";
    self.gameState = 0;
    self.decrementedOnce = NO;
    self.gameOver = NO;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
//    NSLog(@"%d", self.gameState);
    
//    if ([self isLabelNull:self.myLabelArray[0] :self.myLabelArray[1] :self.myLabelArray[2]]) {
//        if([self isGameOver:self.myLabelArray[0] :self.myLabelArray[1] :self.myLabelArray[2]])
//            whichPlayerLabel.text = [self.playerTurn stringByAppendingString:@" WINS!!"];
//    }
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    [self findLabelUsingPoint:point];
    
    if (self.gameState < 9)
    {
        if ([self isLabelNull:myLabelOne.text :myLabelTwo.text :myLabelThree.text] == NO) {
            if ([self isGameOver:myLabelOne.text :myLabelTwo.text :myLabelThree.text] == YES) {
                if ([myLabelOne.text isEqualToString:@"X"]) {
                    self.gameState = 100;
                }
                else {
                    self.gameState = 100;
                }
            }
        }
        
        if (self.gameState % 2 == 0)
        {
            self.playerTurn = @"O";
            whichPlayerLabel.textColor = [UIColor redColor];
            whichPlayerLabel.text = @"Player O's turn!!";
            if (self.gameState > 9)
                self.playerTurn = nil;
        }
        else
        {
            self.playerTurn = @"X";
            whichPlayerLabel.textColor = [UIColor blueColor];
            whichPlayerLabel.text = @"Player X's turn!!";
        }
    }
    
    ++self.gameState;
    
    if (self.gameState > 8)
    {
        whichPlayerLabel.textColor = [UIColor blackColor];
        whichPlayerLabel.text = @"GAME OVER";
    }
}

- (void)findLabelUsingPoint:(CGPoint)point
{
    // Tic Tac Toe Grid
    if (CGRectContainsPoint(myLabelOne.frame, point))
    {
        if (myLabelOne.text == nil)
        {
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelOne.textColor = [UIColor blueColor]; }
            else
            {   myLabelOne.textColor = [UIColor redColor]; }
            myLabelOne.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelTwo.textColor = [UIColor blueColor]; }
                else
            {   myLabelTwo.textColor = [UIColor redColor]; }
            myLabelTwo.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelThree.textColor = [UIColor blueColor]; }
            else
            {   myLabelThree.textColor = [UIColor redColor]; }
            myLabelThree.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelFour.textColor = [UIColor blueColor]; }
            else
            {   myLabelFour.textColor = [UIColor redColor]; }
            myLabelFour.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelFive.textColor = [UIColor blueColor]; }
            else
            {   myLabelFive.textColor = [UIColor redColor]; }
            myLabelFive.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelSix.textColor = [UIColor blueColor]; }
            else
            {   myLabelSix.textColor = [UIColor redColor]; }
            myLabelSix.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelSeven.textColor = [UIColor blueColor]; }
            else
            {   myLabelSeven.textColor = [UIColor redColor]; }
            myLabelSeven.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelEight.textColor = [UIColor blueColor]; }
            else
            {   myLabelEight.textColor = [UIColor redColor]; }
            myLabelEight.text = self.playerTurn;
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
            if ([self.playerTurn  isEqual: @"X"])
            {   myLabelNine.textColor = [UIColor blueColor]; }
            else
            {   myLabelNine.textColor = [UIColor redColor]; }
            myLabelNine.text = self.playerTurn;
        }
        else if (myLabelNine.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;
    
}

- (BOOL)isGameOver:(NSString *)label1 :(NSString *)label2 :(NSString *)label3
{
    if ([label1 isEqual:label2])
        if ([label1 isEqual:label3])
            return YES;
    
    return NO;
}

- (BOOL)isLabelNull:(NSString *)label1 :(NSString *)label2 :(NSString *)label3
{
    if ((label1 = nil) && (label2 = nil) && (label3 = nil))
        return YES;
    
    return NO;
}

//- (void)alertView:(UIAlertView *)alertView gameOver:(NSInteger)buttonIndex
//{
//    if (buttonIndex == 1)
//    {
//        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Game is finished.  Play again?" delegate:self cancelButtonTitle:@"Yes" destructiveButtonTitle:@"No" otherButtonTitles:nil];
//        
//        [sheet showInView:self.view];
//    }
//    [self initialize];
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
