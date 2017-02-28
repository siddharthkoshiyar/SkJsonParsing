//
//  detailviewController.h
//  MachineTask 1
//
//  Created by Student P_04 on 26/02/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailviewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *authorimage;
@property (strong, nonatomic) IBOutlet UILabel *authorname;
@property (strong, nonatomic) IBOutlet UILabel *titleOfBook;

@property(strong,nonatomic)NSString *strauthorname;
@property(strong,nonatomic)NSString *strtitleOfbook;
@property(strong,nonatomic)NSString *strDescription;
@property(strong,nonatomic)NSString *strUrl;

@end
