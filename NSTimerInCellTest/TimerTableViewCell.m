//
//  TimerTableViewCell.m
//  NSTimerInCellTest
//
//  Created by JINGLUO on 15/5/7.
//  Copyright (c) 2015年 JINGLUO. All rights reserved.
//

#import "TimerTableViewCell.h"

@implementation TimerTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self initUI];
    }
    return self;
}

- (void)initUI {
    cellTimer = [[NSTimer alloc] init];
    
    showCountdownTimeLab = [[UILabel alloc] init];
    showCountdownTimeLab.backgroundColor = [UIColor colorWithRed:48/255.0f green:171/255.0f blue:39/255.0f alpha:1.0];
    showCountdownTimeLab.clipsToBounds = YES;
    showCountdownTimeLab.layer.cornerRadius = 5;
    showCountdownTimeLab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:showCountdownTimeLab];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)startTimerWithSecondsNum:(NSInteger)seconds {
    timeCount = seconds;
    cellTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction:) userInfo:nil repeats:YES];
}

- (void)countDownAction:(NSTimer*)timer {
    if (timeCount < 0) {
        [cellTimer invalidate];
    }
    showCountdownTimeLab.text = [NSString stringWithFormat:@"%ld s", timeCount--];
}

- (void)endTimerCount {
    [cellTimer invalidate];
}

- (void)layoutSubviews {
    showCountdownTimeLab.frame = CGRectMake(self.frame.size.width-100, (self.frame.size.height-30)/2, 70, 30);
}

@end
