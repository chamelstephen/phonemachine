//
//  SecondViewController.m
//  telephonemachine
//
//  Created by kento on 2014/11/13.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    hour.keyboardType = UIKeyboardTypeNumberPad;
    minute.keyboardType = UIKeyboardTypeNumberPad;
    second.keyboardType = UIKeyboardTypeNumberPad;
    
    hour.textAlignment = UITextAlignmentRight;
    minute.textAlignment = UITextAlignmentRight;
    second.textAlignment = UITextAlignmentRight;
    
    hour.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    minute.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    second.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
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

- (IBAction)onReturn:(UITextField *)sender {
    [sender resignFirstResponder];
}

-(IBAction)reset{
    hour.text=@"";
    minute.text=@"";
    second.text=@"";
}

-(IBAction)alarmset{
    hournumber=[hour.text intValue];
    minutenumber=[minute.text intValue];
    secondnumber=[second.text intValue];
    NSLog(@"%d",hournumber);
    NSLog(@"%d",minutenumber);
    NSLog(@"%d",secondnumber);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end