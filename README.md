# ReusedCellWithNSTimer
when tableView scrolls, the NSTimer in cell out the screen will stop calculate, and in order to reuse the cell and make sure the NSTimer goes, we need change our mind to find a new way to solve the problem.

Strategy:creat a main timer to count the time has gone, then every timer in cell start to count from the left time (total - the main timer's time).

Problem:It will cause few seconds error.
