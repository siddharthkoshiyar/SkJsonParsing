//
//  detailviewController.m
//  MachineTask 1
//
//  Created by Student P_04 on 26/02/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "detailviewController.h"

@interface detailviewController ()

@end

@implementation detailviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _authorname.text = _strauthorname;
    NSURL *url = [NSURL URLWithString:_strUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    _authorimage.image = [UIImage imageWithData:data];
    
    _titleOfBook.text = _strtitleOfbook;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
