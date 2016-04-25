//
//  LoginViewController.m
//  crudphp_app
//
//  Created by Yosemite on 4/23/16.
//  Copyright (c) 2016 Yosemite. All rights reserved.
//

#import "LoginViewController.h"
#import "myTableViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize u_nm_outerview,u_pass_outerviwe;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}
- (IBAction)login_buttenViwe:(id)sender
{
    NSURL *url = [[NSURL alloc]initWithString:@"http://sgwebtech.in/sg_practical/login.php"];
    
    NSString *stpara = [[NSString alloc]initWithFormat:@"uname=%@&password=%@",u_nm_outerview.text,u_pass_outerviwe.text];
    
    NSMutableURLRequest *req = [[NSMutableURLRequest alloc]initWithURL:url];
    
    [req setHTTPMethod:@"POST"];
    [req setHTTPBody:[stpara dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLConnection *con = [[NSURLConnection alloc]initWithRequest:req delegate:self];
    
    if (con)
    {
        datamute = [[NSMutableData alloc]init];
    }
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    datamute.length=0;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [datamute appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@",[error description]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    NSString *str=[[NSString alloc]initWithData:datamute encoding:NSUTF8StringEncoding];
    
    //NSLog(@"%@",str);
    
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:datamute options:kNilOptions error:nil];
    //NSLog(@"%@",dict);
    NSLog(@"%@",[[dict objectForKey:@"result"]objectAtIndex:0]);
    
    myTableViewController *dtvw = [self.storyboard instantiateViewControllerWithIdentifier:@"myTableViewController"];
    
    dtvw.dict = [[dict objectForKey:@"result"]objectAtIndex:0];
    
    [self.navigationController pushViewController:dtvw animated:YES];
    
   
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
