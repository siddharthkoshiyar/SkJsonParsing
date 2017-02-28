//
//  ViewController.h
//  MachineTask 1
//
//  Created by Student P_04 on 26/02/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *displayTableview;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *mainActivityindicator;

@end

