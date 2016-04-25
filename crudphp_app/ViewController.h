//
//  ViewController.h
//  crudphp_app
//
//  Created by Yosemite on 4/23/16.
//  Copyright (c) 2016 Yosemite. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
{
    NSMutableData *datamute;
}
@property (weak, nonatomic) IBOutlet UITextField *txt_phone;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_address;

@property (weak, nonatomic) IBOutlet UITextField *txt_unm;
@property (weak, nonatomic) IBOutlet UITextField *txt_upass;
- (IBAction)btn_go_action:(id)sender;
@end

