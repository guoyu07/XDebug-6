//
//  RootViewController.m
//  XDebug
//
//  Created by Heramerom on 13-10-24.
//  Copyright (c) 2013年 Heramerom. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.frame = CGRectMake(15.0f, 5.0f, 30.0f, 30.0f);
    [_button setTitle:@"left" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonPress:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:_button];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(320 / 2 - 20, 5, 40, 30)];
    [button addTarget:self action:@selector(titleButtonPress:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"title" forState:UIControlStateNormal];
    self.navigationItem.titleView = button;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    
    [self.view addSubview:_tableView];
}

- (void)titleButtonPress:(UIButton *)sender
{
    //title button press test
}

- (void)buttonPress:(UIButton *)sender
{
    //button press test
}

#pragma mark -
#pragma mark table view delegate method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = @"table view test";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //table view test
}

- (void)didReceiveMemoryWarning
{
    
}

@end
