//
//  TelephoneViewController.m
//  telephonemachine
//
//  Created by kento on 2014/11/27.
//  Copyright (c) 2014年 Kento Ohara. All rights reserved.
//

#import "TelephoneViewController.h"
#import <AudioToolbox/AudioServices.h>

@interface TelephoneViewController ()

@end

@implementation TelephoneViewController

#pragma mark AudioService callback function prototypes
void MyAudioServicesSystemSoundCompletionProc (SystemSoundID ssID,void *clientData);
#pragma mark AudioService callback function implementation
void MyAudioServicesSystemSoundCompletionProc (SystemSoundID ssID,void *clientData)
{
    if (((__bridge TelephoneViewController *)clientData)->flag)
    {
        NSTimeInterval elapsedTime = 0.8;
        [NSThread sleepForTimeInterval:(NSTimeInterval)elapsedTime];
        // バイブ
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    }
    else
    {
        AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    donebutton.hidden=NO;
    takebutton.hidden=NO;
    endbutton.hidden=YES;
    
    secondlabel.hidden=YES;
    minutelabel.hidden=YES;
    under.hidden=YES;
    callinglabel.hidden=NO;
    
    callinglabel.text=@"着信中...";
    callsecond=0;

    fromnumber=arc4random_uniform(2);
    if (fromnumber==1) {
        fromlabel.text=@"お父さん";
    }else{
        fromlabel.text=@"お母さん";
    }
    
    donebutton.layer.cornerRadius = 4.5f;
    takebutton.layer.cornerRadius = 4.5f;
    endbutton.layer.cornerRadius = 4.5f;
    
    flag = YES;
    AudioServicesAddSystemSoundCompletion (
                                           kSystemSoundID_Vibrate,
                                           NULL,
                                           NULL,
                                           MyAudioServicesSystemSoundCompletionProc,
                                           (__bridge void *) self
                                           );
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
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

-(IBAction)take{
    flag = NO;
    AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
    
    endbutton.hidden=NO;
    takebutton.hidden=YES;
    donebutton.hidden=YES;
    
    secondlabel.hidden=NO;
    minutelabel.hidden=NO;
    under.hidden=NO;
    callinglabel.hidden=YES;
    
    secondlabel.text=@"00";
    minutelabel.text=@"00";
    
    calltimer=[NSTimer scheduledTimerWithTimeInterval:1
                                           target:self
                                         selector:@selector(remind)
                                         userInfo:nil
                                          repeats:YES];
}

-(IBAction)done{
    flag = NO;
    AudioServicesRemoveSystemSoundCompletion(kSystemSoundID_Vibrate);
}

-(void)remind{
    secondtime=secondtime+1;
    
    if (secondtime%60<10) {
        secondlabel.text=[NSString stringWithFormat:@"0%d",(secondtime%60)];
    } else {
        secondlabel.text=[NSString stringWithFormat:@"%d",(secondtime%60)];
    }
    if (secondtime/60<10){
        minutelabel.text=[NSString stringWithFormat:@"0%d",(secondtime/60)];
    } else {
        minutelabel.text=[NSString stringWithFormat:@"%d",(secondtime/60)];
    }
}

-(IBAction)end{
    
    endbutton.hidden=YES;
    takebutton.hidden=NO;
    donebutton.hidden=NO;
    
    secondlabel.hidden=YES;
    minutelabel.hidden=YES;
    under.hidden=YES;
    callinglabel.hidden=NO;
    
    [calltimer invalidate];
}
@end
