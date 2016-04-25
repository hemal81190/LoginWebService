//
//  LoginViewController.h
//  crudphp_app
//
//  Created by Yosemite on 4/23/16.
//  Copyright (c) 2016 Yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<NSURLConnectionDelegate>
{
    NSMutableData *datamute;
}
@property (weak, nonatomic) IBOutlet UITextField *u_nm_outerview;

@property (weak, nonatomic) IBOutlet UITextField *u_pass_outerviwe;
- (IBAction)login_buttenViwe:(id)sender;

@end
