//
//  detailCell.h
//  MachineTask 1
//
//  Created by Student P_04 on 26/02/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *authorlabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *urlLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
