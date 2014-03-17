//
//  ViewController.m
//  TicTacToe/Users/manaspradhan/Desktop/MobileMakers/TicTacToe/TicTacToe/ViewController.m
//
//  Created by Manas Pradhan on 3/13/14.
//  Copyright (c) 2014 Manas Pradhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    // The nine squares on the Tic Tac Toe board
    IBOutlet UILabel *myLabelOne;
    IBOutlet UILabel *myLabelTwo;
    IBOutlet UILabel *myLabelThree;
    IBOutlet UILabel *myLabelFour;
    IBOutlet UILabel *myLabelFive;
    IBOutlet UILabel *myLabelSix;
    IBOutlet UILabel *myLabelSeven;
    IBOutlet UILabel *myLabelEight;
    IBOutlet UILabel *myLabelNine;
    
    // Displays X or O player
    IBOutlet UILabel *whichPlayerLabel;
    
    // Button that resets game
    IBOutlet UIButton *playAgain;
    
//    IBOutlet UIButton *xButton;
//    
//    IBOutlet UIButton *oButton;
    
}

// Identifies Player X or Player O turn
@property (weak, nonatomic) NSString *playerTurn;

// Computer's turn
@property (assign, nonatomic) NSInteger cpuTurn;

// Determines which player's turn it is
@property (assign, nonatomic) NSInteger gameState;

// Prevents corruption of gameState in case user clicks a square twice or more
@property (assign, nonatomic) BOOL decrementedOnce;

//// Returns 'YES' is game is over
//@property (assign, nonatomic) BOOL gameOver;

// Returns 'YES' is Player X wins the game
@property (assign, nonatomic) BOOL xIsWinner;

// Returns 'YES' if Player O wins the game
@property (assign, nonatomic) BOOL oIsWinner;

// Returns 'YES' if Player X starts the game
@property (assign, nonatomic) BOOL xStarts;

// Returns 'YES' if Player O starts the game
@property (assign, nonatomic) BOOL oStarts;

// Returns 'YES' if X button is pressed
@property (assign, nonatomic) BOOL xButtonPressed;

// Returns 'YES' if O button is pressed
@property (assign, nonatomic) BOOL oButtonPressed;

// Image of the Tic Tac Toe board
@property (strong, nonatomic) IBOutlet UIImageView *ticTacToeBoard;

// "Play again?" button
@property (nonatomic, retain) IBOutlet UIButton *playAgain;

//@property (nonatomic, retain) IBOutlet UIButton *xButton;
//@property (nonatomic, retain) IBOutlet UIButton *oButton;

@end

@implementation ViewController

@synthesize playAgain;
//@synthesize xButton;
//@synthesize oButton;

- (void)viewDidLoad
{
	[self initialize];
}

// Initialize the game
- (void)initialize
{
    myLabelOne.text         = nil;
    myLabelTwo.text         = nil;
    myLabelThree.text       = nil;
    myLabelFour.text        = nil;
    myLabelFive.text        = nil;
    myLabelSix.text         = nil;
    myLabelSeven.text       = nil;
    myLabelEight.text       = nil;
    myLabelNine.text        = nil;
    
    whichPlayerLabel.textColor = [UIColor blueColor];
    whichPlayerLabel.text   = @"Player X - BEGIN";
    self.playerTurn         = @"X";
    
    self.gameState          = 0;
    self.decrementedOnce    = NO;
    //self.gameOver           = NO;
    self.cpuTurn            = 0;
    
    self.xIsWinner          = NO;
    self.oIsWinner          = NO;
    self.xStarts            = YES;
    self.oStarts            = NO;
    //[playAgain addTarget:self action:@selector(methodTouchDown:) forControlEvents:UIControlEventTouchDown];
    
}

//// Play as "X"
//- (void)pressX:(id)sender
//{
//    self.xStarts            = YES;
//    whichPlayerLabel.text   = @"Player X - BEGIN";
//    
//    self.playerTurn         = @"X";
//    self.gameState          = 0;
//    self.decrementedOnce    = NO;
//    
//    self.xButtonPressed     = YES;
//}
//
//// Play as "O"
//- (void)pressO:(id)sender
//{
//    self.oStarts            = YES;
//    whichPlayerLabel.text   = @"Player O - BEGIN";
//    
//    self.playerTurn         = @"O";
//    self.gameState          = 0;
//    self.decrementedOnce    = NO;
//    
//    self.oButtonPressed     = YES;
//}

// Implementation of "Play again?" button
- (void)pressPlayAgain:(id)sender
{
    myLabelOne.text         = nil;
    myLabelTwo.text         = nil;
    myLabelThree.text       = nil;
    myLabelFour.text        = nil;
    myLabelFive.text        = nil;
    myLabelSix.text         = nil;
    myLabelSeven.text       = nil;
    myLabelEight.text       = nil;
    myLabelNine.text        = nil;
    
    whichPlayerLabel.textColor = [UIColor blackColor];

    // Initializes board for Player X
    if (self.xStarts == YES) {
        whichPlayerLabel.textColor = [UIColor blueColor];
        whichPlayerLabel.text   = @"Player X - BEGIN";
        
        self.playerTurn         = @"X";
        self.gameState          = 0;
        self.decrementedOnce    = NO;
        //self.gameOver           = NO;
    }
    // Initializes board for Player O
    else if (self.oStarts == YES)
    {
        whichPlayerLabel.textColor = [UIColor redColor];
        whichPlayerLabel.text   = @"Player O - BEGIN";
    
        self.playerTurn         = @"O";
        self.gameState          = 0;
        self.decrementedOnce    = NO;
        //self.gameOver           = NO;
    }
    
    self.xIsWinner = NO;
    self.oIsWinner = NO;
}

- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
//    [xButton addTarget:self action:@selector(pressX:) forControlEvents:UIControlEventTouchDown];
//    [oButton addTarget:self action:@selector(pressO:) forControlEvents:UIControlEventTouchDown];
    
    // Invokes "pressPlayAgain" method upon touching "Play again?" button
    [playAgain addTarget:self action:@selector(pressPlayAgain:) forControlEvents:UIControlEventTouchDown];
    
    // Disable X and O buttons if X is pressed
//    if (self.xButtonPressed == YES)
//    {
//        xButton.enabled = NO;
//        oButton.enabled = NO;
//    }
//    
//    // Disable X and O buttons if O is pressed
//    if (self.oButtonPressed == YES)
//    {
//        xButton.enabled = NO;
//        oButton.enabled = NO;
//    }
    
    // X,Y location of where player touches the screen
    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    
    // Invokes "findLabelUsingPoint" method using "point"
    [self findLabelUsingPoint:point];
    
    if (self.gameState < 9)
    {
        // Determine winner while board is playable
        [self findWinner];
    }
    
    // Determines player's turn if Player X starts
    if (self.xStarts == YES)
    {
        if (self.gameState % 2 == 0)
        {
            self.playerTurn            = @"O";
            whichPlayerLabel.textColor = [UIColor redColor];
            whichPlayerLabel.text      = @"Player O's turn!!";
        
            if (self.gameState > 9)
            self.playerTurn = nil;
        }
        else
        {
            self.playerTurn            = @"X";
            whichPlayerLabel.textColor = [UIColor blueColor];
            whichPlayerLabel.text      = @"Player X's turn!!";
        
            if (self.gameState > 9)
                self.playerTurn = nil;
        }
    }
    // Determines player's turn if Player Y starts
    else if (self.oStarts == YES)
    {
        if (self.gameState % 2 == 0)
        {
            self.playerTurn            = @"X";
            whichPlayerLabel.textColor = [UIColor blueColor];
            whichPlayerLabel.text      = @"Player X's turn!!";
            
            if (self.gameState > 9)
                self.playerTurn = nil;
        }
        else
        {
            self.playerTurn            = @"O";
            whichPlayerLabel.textColor = [UIColor redColor];
            whichPlayerLabel.text      = @"Player O's turn!!";
            
            if (self.gameState > 9)
                self.playerTurn = nil;
        }
    }
    
    // Counter that tracks progress of game
    ++self.gameState;
    
    // Determines final result of the game
    if (self.gameState > 8)
    {
        // Player X wins
        if (self.xIsWinner == YES) {
            whichPlayerLabel.textColor = [UIColor blueColor];
            whichPlayerLabel.text      = @"Player X wins!!!";
            self.xStarts               = NO;
            self.oStarts               = YES;
        }
        // Player O wins
        else if (self.oIsWinner == YES) {
            whichPlayerLabel.textColor = [UIColor redColor];
            whichPlayerLabel.text      = @"Player O wins!!!";
            self.xStarts               = YES;
            self.oStarts               = NO;
        }
        // Cat's Game
        else
        {
            whichPlayerLabel.textColor = [UIColor blackColor];
            whichPlayerLabel.text      = @"CAT'S GAME :3";
        }
    }
}

// Detects which square on the board is tapped and populates it with X or O based on which player's turn
- (void)findLabelUsingPoint:(CGPoint)point
{
    // Square 1 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelOne.text != nil && self.decrementedOnce == NO)
        {
                --self.gameState;
                self.decrementedOnce = YES;
            }
        }
    else self.decrementedOnce = NO;
    
    // Square 2 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelTwo.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;
    
    // Square 3 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelThree.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;
    
    // Square 4 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelFour.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;
    
    // Square 5 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelFive.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;

    // Square 6 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelSix.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;

    // Square 7 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelSeven.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;
    
    // Square 8 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelEight.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;
    
    // Square 9 is tapped
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
        // Prevents mutiple taps on same square
        else if (myLabelNine.text != nil && self.decrementedOnce == NO)
        {
            --self.gameState;
            self.decrementedOnce = YES;
        }
    }
    else self.decrementedOnce = NO;
    
}

// Class method; returns 'YES' if all three strings match
- (BOOL)isGameOver:(NSString *)label1 :(NSString *)label2 :(NSString *)label3
{
    if ([label1 isEqual:label2])
        if ([label1 isEqual:label3])
            return YES;
    
    return NO;
}

// Class method; returns 'YES' if all three strings are empty
- (BOOL)isLabelNull:(NSString *)label1 :(NSString *)label2 :(NSString *)label3
{
    if ((label1 = nil) && (label2 = nil) && (label3 = nil))
        return YES;
    
    return NO;
}

// Class method; determines winner of the game for eight possible outcomes
- (void)findWinner
{
    if ([self isLabelNull:myLabelOne.text :myLabelTwo.text :myLabelThree.text] == NO) {
        if ([self isGameOver:myLabelOne.text :myLabelTwo.text :myLabelThree.text] == YES) {
            
            if ([myLabelOne.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
            else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
    
    if ([self isLabelNull:myLabelFour.text :myLabelFive.text :myLabelSix.text] == NO) {
        if ([self isGameOver:myLabelFour.text :myLabelFive.text :myLabelSix.text] == YES) {
            
            if ([myLabelFour.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            } else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
    
    if ([self isLabelNull:myLabelSeven.text :myLabelEight.text :myLabelNine.text] == NO) {
        if ([self isGameOver:myLabelSeven.text :myLabelEight.text :myLabelNine.text] == YES) {
            
            if ([myLabelSeven.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            } else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
    
    if ([self isLabelNull:myLabelOne.text :myLabelFour.text :myLabelSeven.text] == NO) {
        if ([self isGameOver:myLabelOne.text :myLabelFour.text :myLabelSeven.text] == YES) {
            
            if ([myLabelOne.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            } else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
    
    if ([self isLabelNull:myLabelTwo.text :myLabelFive.text :myLabelEight.text] == NO) {
        if ([self isGameOver:myLabelTwo.text :myLabelFive.text :myLabelEight.text] == YES) {
            
            if ([myLabelTwo.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            } else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
    
    if ([self isLabelNull:myLabelThree.text :myLabelSix.text :myLabelNine.text] == NO) {
        if ([self isGameOver:myLabelThree.text :myLabelSix.text :myLabelNine.text] == YES) {
            
            if ([myLabelThree.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            } else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
    
    if ([self isLabelNull:myLabelOne.text :myLabelFive.text :myLabelNine.text] == NO) {
        if ([self isGameOver:myLabelOne.text :myLabelFive.text :myLabelNine.text] == YES) {
            
            if ([myLabelOne.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            } else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
    
    if ([self isLabelNull:myLabelThree.text :myLabelFive.text :myLabelSeven.text] == NO) {
        if ([self isGameOver:myLabelThree.text :myLabelFive.text :myLabelSeven.text] == YES) {
            
            if ([myLabelThree.text isEqualToString:@"X"]) {
                self.xIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            } else {
                self.oIsWinner             = YES;
                self.gameState             = 100;
                //self.gameOver              = YES;
            }
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
