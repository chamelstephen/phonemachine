//
//  ThirdViewController.m
//  telephonemachine
//
//  Created by kento on 2014/11/13.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//

#import "ThirdViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    pick.datePickerMode = UIDatePickerModeTime;
    pick.minuteInterval = 5;
    
    [pick addTarget:self
             action:@selector(hoge:)
   forControlEvents:UIControlEventValueChanged];
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

-(void)hoge:(UIDatePicker*)sender{
    
    pick=sender;
    
    df = [[NSDateFormatter alloc]init];
    df.dateFormat = @"HH:mm:00";
    
    //NSLog(@"選択された時刻=%@",[df stringFromDate:pick.date]);
    
    formattedstring = [df stringFromDate:pick.date];
    
    //NSLog(@"formattedstring=%@",formattedstring);
    
}


-(IBAction)alarmset{
    
    //NSDate *now = [NSDate date];
    
    tm=[[NSDateFormatter alloc]init];
    tm.dateFormat=@"HH:mm:ss";
    NSString *nowtimestring=[tm stringFromDate:[NSDate date]];
    
    //NSLog(@"現在時刻=%@",[tm stringFromDate:[NSDate date]]);
    //NSLog(@"nowtimestring=%@",nowtimestring);
    
    NSDate *timenow=[tm dateFromString:nowtimestring];
    
    //NSLog(@"timenow=%@",timenow);
    
    NSDate *pickdate=[df dateFromString:formattedstring];
    
    //NSLog(@"pickdate=%@",pickdate);
    
    NSTimeInterval since=[pickdate timeIntervalSinceDate:timenow];
    
    NSInteger sec=(int)since;
    
    NSLog(@"差=%ld sec",(long)sec);
    hournumber=(int)sec/60/60;
    NSLog(@"hournumber=%d",hournumber);
    minutenumber=(int)sec/60%60;
    NSLog(@"minutenumber=%d",minutenumber);
    secondnumber=(int)sec-hournumber*60*60-minutenumber*60;
    NSLog(@"secondnumber=%d",secondnumber);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
