//
//  AppDelegate.m
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import "AppDelegate.h"
#import <MyOrder/MyOrder.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    MyOrder *myOrder = [MyOrder shared];
    myOrder.apiKey = @"36bd8913-bf56-4aa0-9492-49a3240597ea";
    myOrder.apiSecret = @"12H@c9kT$At";
    myOrder.environment = MyOrderEnvironmentPlayground;
    myOrder.URLScheme = @"myorder-sdk";
    
    self.geoLocManagerSingleton = [GeoLocationManager singleton];
    
    if(launchOptions)
        [self.geoLocManagerSingleton consumeSystemNotification:[launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey]];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"didReceiveLocalNotification");
    
    [self.geoLocManagerSingleton consumeSystemNotification:notification];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self resetDemo];

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) resetDemo{
    //reset demo
    self.geoLocManagerSingleton.encountredBecons = [@{} mutableCopy];
}

@end
