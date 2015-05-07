//
//  TimerTableViewCell.h
//  NSTimerInCellTest
//
//  Created by JINGLUO on 15/5/7.
//  Copyright (c) 2015年 JINGLUO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerTableViewCell : UITableViewCell {
    NSTimer *cellTimer;
    NSInteger timeCount;
    UILabel *showCountdownTimeLab;
}

- (void)startTimerWithSecondsNum:(NSInteger)seconds;
- (void)endTimerCount;

@end
