//
//  RootViewController.h
//  XDebug
//
//  Created by Heramerom on 13-10-24.
//  Copyright (c) 2013年 Heramerom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UIButton *_button;
    UITableView *_tableView;
}

@end
