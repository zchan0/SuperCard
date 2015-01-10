//
//  ViewController.m
//  SuperCard
//
//  Created by zhengcc on 15/1/9.
//  Copyright (c) 2015年 zhengcc. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardView.h"
#import "Card+PlayingCard.h"
#import "Deck+PlayingDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;
@property (strong, nonatomic) PlayingDeck *deck;
@end

@implementation ViewController

- (PlayingDeck *)deck
{
    if (!_deck) {
        _deck = [[PlayingDeck alloc] init];
    }
    return _deck;
}

- (void)drawRandomPlayingCard
{
    Card *card = [self.deck drawRandomCard];
    if ([card isKindOfClass:[PlayingCard class]]) {
        PlayingCard *playingCard = (PlayingCard *)card;
        self.playingCardView.rank = playingCard.rank;
        self.playingCardView.suit = playingCard.suit;
    }
}

- (IBAction)swipe:(UISwipeGestureRecognizer *)sender
{
    if (!self.playingCardView.faceUP) {
        [self drawRandomPlayingCard];
    }
    self.playingCardView.faceUP = !self.playingCardView.faceUP;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.deck = [[PlayingDeck alloc] init];
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pinch:)]];
}



@end
