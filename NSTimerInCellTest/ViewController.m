//
//  ViewController.m
//  NSTimerInCellTest
//
//  Created by JINGLUO on 15/5/7.
//  Copyright (c) 2015年 JINGLUO. All rights reserved.
//



//////////////////////////////
//when tableView scrolls, the NSTimer in cell out the screen will stop calculate, and in order to reuse the cell and make sure the NSTimer goes, we need change our mind to find a new way to solve the problem.
//
//
//
//
//reused cell with NSTimer
//
//creat a main timer to count the time has gone, then every timer in cell start to count from the left time (total - the main timer's time)
//
//pronlem: It will cause few seconds error
//
//////////////////////////////


#import "ViewController.h"
#import "TimerTableViewCell.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate> {
    UITableView *mTableView;
    NSTimer *mTimer;
    UILabel *timerLab;
    
    NSInteger timeCount;
    NSArray *dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dataArray = [[NSArray alloc] init];
    
    timerLab = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-200)/2, 30, 200, 30)];
    timerLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:timerLab];
    
    mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(timerLab.frame)+10, self.view.frame.size.width, 200) style:UITableViewStylePlain];
    mTableView.delegate = self;
    mTableView.dataSource = self;
    mTableView.backgroundColor = [UIColor clearColor];
    mTableView.rowHeight = 44;
    [self.view addSubview:mTableView];
    
    [self setDataArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - data source

- (void)setDataArray {
    dataArray = @[@"10", @"20", @"30", @"400", @"500", @"600", @"700", @"800", @"900", @"1000"];
    
    timeCount = 0;
    mTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownAction:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:mTimer forMode:NSRunLoopCommonModes];
    
    [mTableView reloadData];
}

- (void)countDownAction:(NSTimer*)timer {
    timerLab.text = [NSString stringWithFormat:@"time goes %ld s", timeCount++];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [dataArray count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifiey = @"timerCell";
    TimerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifiey];
    if (cell == nil) {
        cell = [[TimerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifiey];
    }
    
    [cell endTimerCount];
    [cell startTimerWithSecondsNum:[[dataArray objectAtIndex:indexPath.row] integerValue]-timeCount];
    if ([[dataArray objectAtIndex:indexPath.row] integerValue] <= 0) {
        [cell endTimerCount];
    }
    
    return cell;
}


@end
