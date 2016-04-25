//
//  ViewController.m
//  crudphp_app
//
//  Created by Yosemite on 4/23/16.
//  Copyright (c) 2016 Yosemite. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txt_phone,txt_address,txt_email,txt_unm,txt_upass;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)btn_go_action:(id)sender
{
    [self.view endEditing:YES];
    
    NSURL *url=[NSURL URLWithString:@"http://sgwebtech.in/sg_practical/register.php"];
    
    NSString *st_body=[NSString stringWithFormat:@"uname=%@&password=%@&phoe=%@&email=%@&address=%@",txt_unm.text,txt_upass.text,txt_phone.text,txt_email.text,txt_address.text];
    
    NSMutableURLRequest *req=[[NSMutableURLRequest alloc]initWithURL:url];
    [req setHTTPBody:[st_body dataUsingEncoding:NSUTF8StringEncoding]];
    [req setHTTPMethod:@"POST"];
    
    NSURLConnection *con=[NSURLConnection connectionWithRequest:req delegate:self];
    if (con)
    {
        datamute=[[NSMutableData alloc]init];
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
    NSLog(@"%@",str);
    
    
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:datamute options:kNilOptions error:nil];
    NSString *result=@"";
    if ([[dict objectForKey:@"success"]intValue]==1)
    {
        result=@"inserted..";
    }
    else
    {
        result=@"faild..";
    }
    
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Alert" message:[dict objectForKey:@"msg"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alrt show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
