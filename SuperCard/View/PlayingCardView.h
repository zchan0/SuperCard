//
//  PlayingCardView.h
//  SuperCard
//
//  Created by zhengcc on 15/1/9.
//  Copyright (c) 2015年 zhengcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) BOOL faceUP;

- (void) pinch:(UIPinchGestureRecognizer *)gesture;

@end
