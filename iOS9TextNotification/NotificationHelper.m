//
//  NotificationHelper.m
//  iOS9TextNotification
//
//  Created by lq09984 on 15/9/18.
//  Copyright © 2015年 Ql. All rights reserved.
//

#import "NotificationHelper.h"

@interface NotificationHelper ()

@end

@implementation NotificationHelper

- (void)askPermission {
    
    //Actions
    
    UIMutableUserNotificationAction *textActionFast = [[UIMutableUserNotificationAction alloc] init];
    textActionFast.identifier = @"test_text_action1";
    textActionFast.title = @"快速回复";
    textActionFast.activationMode = UIUserNotificationActionContextDefault;
    textActionFast.authenticationRequired = NO;
    textActionFast.behavior = UIUserNotificationActionBehaviorDefault;
    
    UIMutableUserNotificationAction *textAction = [[UIMutableUserNotificationAction alloc] init];
    textAction.identifier = @"test_text_action";
    textAction.title = @"回复";
    textAction.activationMode = UIUserNotificationActivationModeForeground;
    textAction.authenticationRequired = YES;
    textAction.behavior = UIUserNotificationActionBehaviorTextInput;

    //Category
    UIMutableUserNotificationCategory *category = [[UIMutableUserNotificationCategory alloc]init];
    category.identifier = @"category_id";
    //Default最多支持4个,Action,Minimal则最多支持2个。
    //Default用于标准弹框通知显示Action列表，Minimal用于锁屏、通知中心、顶部通知(banner)时显示 Actions列表。
    [category setActions:@[textAction,textActionFast] forContext:UIUserNotificationActionContextMinimal];
    NSSet *categories = [NSSet setWithObjects:category, nil];
    
    //注册通知
    UIUserNotificationType types = UIUserNotificationTypeAlert | UIUserNotificationTypeSound |UIUserNotificationTypeBadge;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:types
                                                                             categories:categories];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];

}

- (void)presentLocalNotificationNow {
    
    UILocalNotification *reminder = [[UILocalNotification alloc] init];
    reminder.alertBody = @"你可以立即回复";
    reminder.alertTitle = @"[微信红包]";
    //reminder.alertAction = @"Cool";
    reminder.soundName = @"sound.aif";
    reminder.category = @"category_id";
    [[UIApplication sharedApplication] presentLocalNotificationNow:reminder];
}

@end
