//
//  ViewController.m
//  MachineTask 1
//
//  Created by Student P_04 on 26/02/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"
#import "detailCell.h"
#import "detailviewController.h"
@interface ViewController (){
    NSDictionary *dictionary;
    NSArray *dataArray;
    UIActivityIndicatorView *progress;
    }

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    progress= [[UIActivityIndicatorView alloc] initWithFrame: CGRectMake(150 ,150, 60, 60)];
    progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    progress.color = [UIColor redColor];
      [self.displayTableview addSubview:progress];
    [progress startAnimating];
    
       [self parseJson];
}
-(void)parseJson{
    
    NSString *stringOfJson = @"https://newsapi.org/v1/articles?source=techcrunch&apiKey=efe99de73d1d49608eb3d4e87c536b26";
    NSURL *url = [NSURL URLWithString:stringOfJson];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse * response, NSError *error) {
        if (data != nil) {
            dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSLog(@"%@",dictionary);
            
            dataArray = [dictionary objectForKey:@"articles"];
            NSLog(@"%@",dataArray);
             [_displayTableview reloadData];
            [progress stopAnimating];
            [progress removeFromSuperview];
            
            
            
        }
    }];
    [dataTask resume];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
         //Your main thread code goes in here
        static NSString *str = @"cell";
        detailCell *cell = [_displayTableview dequeueReusableCellWithIdentifier:str];
        if ( cell == nil) {
            cell  =[[detailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        [cell.activityIndicator startAnimating];
        cell.authorlabel.text = [NSString stringWithFormat:@"%@",[[dataArray objectAtIndex:indexPath.row]valueForKey:@"author"]];
        
        
        cell.titleLabel.text = [NSString stringWithFormat:@"%@",[[dataArray objectAtIndex:indexPath.row]valueForKey:@"description"]];
        cell.urlLabel.text = [NSString stringWithFormat:@"%@",[[dataArray objectAtIndex:indexPath.row] valueForKey:@"urlToImage"]];
        return cell;
        
         

    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    detailCell *cell = [_displayTableview cellForRowAtIndexPath:indexPath];
    detailviewController *obj = [story instantiateViewControllerWithIdentifier:@"detailviewController"];
    NSLog(@"%@",cell.authorlabel.text);
    obj.strauthorname = [NSString stringWithFormat:@"%@",cell.authorlabel.text];
    obj.strtitleOfbook = [NSString stringWithFormat:@"%@",cell.titleLabel.text];
    obj.strUrl = [NSString stringWithFormat:@"%@",cell.urlLabel.text];
    obj.strDescription = [NSString stringWithFormat:@"%@",cell.titleLabel.text];
    
    [self.navigationController pushViewController:obj animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
