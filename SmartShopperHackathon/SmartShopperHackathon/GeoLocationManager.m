#import "GeoLocationManager.h"

@interface GeoLocationManager ()

@end

@implementation GeoLocationManager

+ (GeoLocationManager *)singleton{
    static GeoLocationManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        singleton = [[self alloc] init];
    });
    return singleton;
}

- (id)init{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        self.locationManager.distanceFilter = DISTANCE_FILTER;
        
        CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:PROXIMITY_GUID] identifier: PROXIMITY_ID];
        region.notifyEntryStateOnDisplay = YES;
        region.notifyOnEntry = YES;
        
        [self.locationManager stopMonitoringForRegion:region];
        [self.locationManager startMonitoringForRegion:region];
        
        [self.locationManager startUpdatingLocation];
        //[self.locationManager stopUpdatingLocation];

    }
    
    return self;
}

#pragma GPS stuff

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"locationManager didUpdateLocations");
    self.location = locations.lastObject;
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"locationManager didFailWithError");

}


#pragma beacons stuff

- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLBeaconRegion *)region{
    NSLog(@"locationManager didDetermineState");
    
    if(state == CLRegionStateInside) {
        
        NSLog(@"INSIDE region %@", region.identifier);
        
        [self.locationManager startRangingBeaconsInRegion:region];
        
    }else if(state == CLRegionStateOutside) {
        NSLog(@"OUTSIDE region %@ ", region.proximityUUID.UUIDString);
    }else {
        NSLog(@"locationManager didDetermineState OTHER for %@ ", region.proximityUUID.UUIDString);
    }
}

- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region{
    
    NSLog(@"locationManager didRangeBeacons number of beacons:%lu", (unsigned long)[beacons count]);
    
    if(!self.encountredBecons || [self.encountredBecons count]<=0) self.encountredBecons = [@{} mutableCopy];
    
    //get the closest beacon detected
    CLBeacon * firstBeacon = nil;
    if(beacons && [beacons count]>0)firstBeacon = beacons[0];
    
    if(firstBeacon && ![[self.encountredBecons objectForKey:[NSString stringWithFormat:@"%@%@%@", firstBeacon.proximityUUID.UUIDString, firstBeacon.minor.stringValue, firstBeacon.major.stringValue]] boolValue]){
        
        NSLog(@"locationManager didRangeBeacons UUID %@ Minor %@ Major %@", firstBeacon.proximityUUID.UUIDString, firstBeacon.minor.stringValue, firstBeacon.major.stringValue);
        
        // DO STUFF IN BACKGROUND OR STOPPED APP STATE
        if ([[UIApplication sharedApplication] applicationState] != UIApplicationStateActive){
            NSLog(@"Not Active state. next to beacon %@", firstBeacon.proximityUUID.UUIDString);
            
            NSDictionary *beacon = [NSDictionary dictionaryWithObjectsAndKeys:firstBeacon.proximityUUID.UUIDString,UUID_STRING, firstBeacon.major.stringValue,MAJOR_STRING,firstBeacon.minor.stringValue,MINOR_STRING, RANGING_NON_ACTIVE, INVOCATION_ORIGINE_STRING, nil];
            
            //push local notification
            [self pushSystemNotification:beacon];
        
        }else{//DO STUFF IN FOREGROUND
         
            NSLog(@"Active state. next to beacon %@", firstBeacon.proximityUUID.UUIDString);
            NSDictionary *beacon = [NSDictionary dictionaryWithObjectsAndKeys:firstBeacon.proximityUUID.UUIDString,UUID_STRING, firstBeacon.major.stringValue,MAJOR_STRING,firstBeacon.minor.stringValue,MINOR_STRING, RANGING_ACTIVE, INVOCATION_ORIGINE_STRING, nil];

            //push local notification
            [self pushSystemNotification:beacon];

        }
        
        //record that this beacons was encountred before already
        [self.encountredBecons setObject:[NSNumber numberWithBool:YES] forKey:[NSString stringWithFormat:@"%@%@%@", firstBeacon.proximityUUID.UUIDString, firstBeacon.minor.stringValue, firstBeacon.major.stringValue]];
        
        //[manager stopRangingBeaconsInRegion:region];
    }
}

@end