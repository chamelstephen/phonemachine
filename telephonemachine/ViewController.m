//
//  ViewController.m
//  telephonemachine
//
//  Created by kento on 2014/11/03.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import <AudioToolbox/AudioServices.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    hourlabel.text=[NSString stringWithFormat:@"%d",hournumber];
    minutelabel.text=[NSString stringWithFormat:@"%d",minutenumber];
    secondlabel.text=[NSString stringWithFormat:@"%d",secondnumber];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated/*１つ目の画面に戻った時*/{
    hourlabel.text=[NSString stringWithFormat:@"%d",hournumber];
    minutelabel.text=[NSString stringWithFormat:@"%d",minutenumber];
    secondlabel.text=[NSString stringWithFormat:@"%d",secondnumber];
    
    if(hournumber>0||minutenumber>0||secondnumber>0){
        timer=[NSTimer scheduledTimerWithTimeInterval:1
                                               target:self
                                             selector:@selector(remind)
                                             userInfo:nil
                                              repeats:YES];
        
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        // インスタンス生成
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:(360*hournumber+60*minutenumber+secondnumber)];
        NSLog(@"%d",(360*hournumber+60*minutenumber+secondnumber));
        notification.alertBody = @"着信です";
        notification.hasAction = YES ;
        notification.soundName = UILocalNotificationDefaultSoundName;
        notification.alertAction = @"電話を着信させる";
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
        
    }
    
    
}

-(void)remind{
    secondnumber=secondnumber-1;
    
    if (secondnumber<0) {
        secondnumber=59;
        minutenumber=minutenumber-1;
    }
    if (minutenumber<0) {
        minutenumber=59;
        hournumber=hournumber-1;
    }
    
    secondlabel.text=[NSString stringWithFormat:@"%d",secondnumber];
    minutelabel.text=[NSString stringWithFormat:@"%d",minutenumber];
    hourlabel.text=[NSString stringWithFormat:@"%d",hournumber];
    
    if (secondnumber==0&&minutenumber==0&&hournumber==0) {
        
        TelephoneViewController *TelephoneView = [self.storyboard instantiateViewControllerWithIdentifier:@"phone"];
        [self presentViewController:TelephoneView animated:YES completion:nil];
        
        [timer invalidate];
    }
}

-(IBAction)cancel{
    
    if ([timer isValid]) {
        [timer invalidate];
    }
    
    hournumber=0;
    minutenumber=0;
    secondnumber=0;
    
    hourlabel.text=@"0";
    minutelabel.text=@"0";
    secondlabel.text=@"0";
    
}
//起動していないときの通知

@end
