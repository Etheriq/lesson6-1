//
//  GameViewController.m
//  Lesson6
//
//  Created by Yuriy T on 12.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "GameViewController.h"
#import "Game.h"
#import "PlayingCardDeck.h"

@interface GameViewController ()

@property (strong, nonatomic) Game *game;
@property (weak, nonatomic) PlayingCard *currentPlayCard;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardsButton;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameLogLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardLogLabel;

@end

@implementation GameViewController

#pragma mark - Logic

- (Game *)game {
    if (!_game) {
        _game = [[Game alloc] initWithCardCount:[self.cardsButton count]
                                      usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

- (void) showGameOverVC {
    
    [UIView beginAnimations:@"Showinfo" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.75f];
    [self performSegueWithIdentifier:@"game_over" sender:nil];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

-(NSString *) titleForCard:(Card *)card {
    return (card.isChosen) ? card.contents : @"";
}

-(UIImage *) backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:(card.isChosen) ? @"cardfront" : @"cardback"];
}

-(void) updateUI {
    for (UIButton *cardButton in self.cardsButton) {
        NSUInteger cardIndex = [self.cardsButton indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.cardLogLabel.text = [NSString stringWithString:self.game.matchLog];
        self.scoreLabel.text = [NSString stringWithFormat:@"Total score: %li", self.game.score];
        self.gameLogLabel.text = [NSString stringWithFormat:@"Opened %@, current score: %li", self.currentPlayCard.contents, self.game.currentScore];
    }
    
    if (self.game.gameFinished) {
        NSLog(@"Game finished");
        
        if (self.tabBarController.selectedIndex == 0) {
            [self showGameOverVC];
        } else if (self.tabBarController.selectedIndex == 1) {
            [self performSegueWithIdentifier:@"pop" sender:nil];
        }
    }
}

#pragma mark - Actions

- (IBAction)cardButtonTapped:(UIButton *)sender {
    NSUInteger cardIndex = [self.cardsButton indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    
    self.currentPlayCard = [self.game playCardAtIndex:cardIndex];
    [self updateUI];
}

- (IBAction)resetButtonTapped:(UIButton *)sender {
    
    self.game = nil;
    [self updateUI];
    self.gameLogLabel.text = @"Log is empty.";
    self.cardLogLabel.text = @"Card log is empty.";
}

#pragma mark - View
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cardLogLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.cardLogLabel.numberOfLines = 0;
    self.scoreLabel.text = [NSString stringWithFormat:@"Total score: %li", self.game.score];
    self.gameLogLabel.text = @"Log is empty.";
    self.cardLogLabel.text = @"Card log is empty.";
    
    self.navigationItem.title = @"Card game";
    
    NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationMaskPortrait];
    [[UIDevice currentDevice] setValue:value forKey:@"orientation"];

}

-(BOOL) shouldAutorotate {
    return NO;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (IBAction)forceGameOverButton:(UIButton *)sender {
//    [self performSegueWithIdentifier:@"game_over" sender:nil];
    
    [self showGameOverVC];
}


/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
