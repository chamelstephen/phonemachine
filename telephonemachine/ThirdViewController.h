//
//  ThirdViewController.h
//  telephonemachine
//
//  Created by kento on 2014/11/13.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThirdViewController : UIViewController
{
    IBOutlet UIDatePicker*pick;
    
    NSDateFormatter *df;
    NSDateFormatter *tm;
    
    NSString *formattedstring;
    
    
}
-(IBAction)alarmset;
-(IBAction)back;
@end
