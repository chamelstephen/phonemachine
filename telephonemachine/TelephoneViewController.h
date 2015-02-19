//
//  TelephoneViewController.h
//  telephonemachine
//
//  Created by kento on 2014/11/27.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//
int fromnumber;

int callsecond;

#import <UIKit/UIKit.h>

@interface TelephoneViewController : UIViewController
{
    IBOutlet UILabel*fromlabel;
    IBOutlet UIButton*takebutton;
    IBOutlet UIButton*donebutton;
    IBOutlet UIButton*endbutton;
    
    IBOutlet UILabel*callinglabel;
    IBOutlet UILabel*secondlabel;
    IBOutlet UILabel*minutelabel;
    IBOutlet UILabel*under;
    
    NSTimer*calltimer;
    int secondtime;
    
    BOOL flag;
}
-(IBAction)done;
-(IBAction)take;
-(IBAction)end;
@end
