//
//  AppDelegate.h
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeoLocationManager.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) GeoLocationManager *geoLocManagerSingleton;;

- (void) resetDemo;

@property (strong, nonatomic) UIWindow *window;

@end
