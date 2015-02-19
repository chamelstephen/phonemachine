//
//  ViewController.h
//  telephonemachine
//
//  Created by kento on 2014/11/03.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//
int hournumber;
int minutenumber;
int secondnumber;

#import <UIKit/UIKit.h>
#import "TelephoneViewController.h"
@interface ViewController : UIViewController

{
    IBOutlet UILabel*hourlabel;
    IBOutlet UILabel*minutelabel;
    IBOutlet UILabel*secondlabel;
    NSTimer*timer;
    
}
-(IBAction)cancel;

@end

