#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma notifs


-(void) pushSystemNotification:(NSDictionary *) beacon{
    NSLog(@"pushLocalNotification");
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    UILocalNotification * localNotif = [[UILocalNotification alloc] init];
    localNotif.alertAction = @"to see the offer";
    localNotif.applicationIconBadgeNumber = 1;
    localNotif.alertBody = @"Buy at our store and get 20% off for your wife's birthday gift";
    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.fireDate = [NSDate date];
    
    localNotif.userInfo = beacon;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
}

- (void) consumeSystemNotification:(UILocalNotification *)notification{
    NSLog(@"consumeNotification");
    
    if(!notification){
        NSLog(@"Notification nil");
        return;
    }
    
    if(!notification.userInfo [UUID_STRING] || !notification.userInfo[MAJOR_STRING] || !notification.userInfo[MINOR_STRING]){
        NSLog(@"some of uuid or major or minor are not valid");
        return;
    }
   
    //option1: display alert
    //[self displayAlert:notification];
    
    //option2: push event to notification center
    [self pushNotificationCenter:notification];

    //option3: navigate to other screen
    //navigate to the screen showing the notification
    //SecondViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"secondViewController"];
    //viewController.receivedData = msg;
    //[self presentViewController:viewController animated:YES completion:nil];
    
}

-(void) displayAlert:(UILocalNotification *) notification{
    NSString *msg = [NSString stringWithFormat:@"%@, %@, %@, %@", notification.alertBody, notification.userInfo[UUID_STRING] , notification.userInfo [MAJOR_STRING] , notification.userInfo[MINOR_STRING]];
    
    UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [myAlertView show];
}

-(void) pushNotificationCenter:(UILocalNotification *) notification{
    NSLog(@"pushNotificationCenter");
    
    NSDictionary *notificationCenterMessage = @{UUID_STRING:notification.userInfo [UUID_STRING], MAJOR_STRING:notification.userInfo[MAJOR_STRING], MINOR_STRING:notification.userInfo[MINOR_STRING], INVOCATION_ORIGINE_STRING:notification.userInfo[INVOCATION_ORIGINE_STRING], @"ALERT_BODY":notification.alertBody};
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BEACONS_NOTIF_CENTER" object:self userInfo:notificationCenterMessage];
}

#pragma clean

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
