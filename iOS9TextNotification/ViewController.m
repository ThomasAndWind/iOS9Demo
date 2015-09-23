//
//  ViewController.m
//  iOS9TextNotification
//
//  Created by lq09984 on 15/9/18.
//  Copyright © 2015年 Ql. All rights reserved.
//

#import "ViewController.h"
#import "NotificationHelper.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *rspLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveReply:) name:@"text" object:nil];
}
- (void)receiveReply:(NSNotification *)notification {
    
    NSDictionary *dic = notification.userInfo;
    self.rspLabel.text = [dic objectForKey:@"text"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didPressSchdeule:(id)sender {
    NotificationHelper *helper = [[NotificationHelper alloc] init];
    [helper presentLocalNotificationNow];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"text" object:nil];
}
@end
