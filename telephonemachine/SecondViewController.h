//
//  SecondViewController.h
//  telephonemachine
//
//  Created by kento on 2014/11/13.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

{
    IBOutlet UITextField*hour;
    IBOutlet UITextField*minute;
    IBOutlet UITextField*second;
}
-(IBAction)reset;
-(IBAction)alarmset;
-(IBAction)back;

-(IBAction)onReturn:(id)sender;
@end
