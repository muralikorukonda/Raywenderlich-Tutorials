//
//  RWTRefreshingTableViewController.m
//  PullToRefresh
//
//  Created by Main Account on 5/1/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

#import "RWTRefreshingTableViewController.h"
#import "RWTRefreshView.h"
#import "RWTRefreshItem.h"

static CGFloat kTestViewHeight = 200.f;

@interface RWTRefreshingTableViewController () <RWTRefreshViewDelegate>
@property (nonatomic, strong) RWTRefreshView *refreshView;
@end

@implementation RWTRefreshingTableViewController

- (void)viewDidLoad {

  self.refreshView = [[RWTRefreshView alloc] initWithFrame:CGRectMake(0, -kTestViewHeight, CGRectGetWidth(self.view.bounds), kTestViewHeight) scrollView:(UIScrollView *)self.view];
  self.refreshView.translatesAutoresizingMaskIntoConstraints = NO;
  self.refreshView.delegate = self;
  [self.view insertSubview:self.refreshView atIndex:0];

}

- (void)artificialDelay {
  
  __weak RWTRefreshingTableViewController *weakSelf = self;
  double delayInSeconds = 3.f;
  dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
  dispatch_after(delayTime, dispatch_get_main_queue(), ^(void) {
    [weakSelf endRefreshing];
  });
  
}

- (void)endRefreshing {
  [self.refreshView endRefreshing];
}

#pragma mark - RWTRefreshViewDelegate

- (void)refreshViewDidRefresh:(RWTRefreshView *)refreshView {
  [self artificialDelay];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  [self.refreshView scrollViewDidScroll:scrollView];
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  [self.refreshView scrollViewWillEndDragging:scrollView withVelocity:velocity targetContentOffset:targetContentOffset];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
  
  cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
  
  return cell;
}

@end
