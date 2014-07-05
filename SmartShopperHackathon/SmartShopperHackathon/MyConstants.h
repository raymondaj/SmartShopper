#import <Foundation/Foundation.h>

@interface MyConstants : NSObject

//GPS
#define DISTANCE_FILTER 100

//Beacons

#define PROXIMITY_GUID @"f2a74fc4-7625-44db-9b08-cb7e130b2029"
#define PROXIMITY_ID @"raboBankHackathon"

#define RANGING_ACTIVE  [NSNumber numberWithInt:0]
#define RANGING_NON_ACTIVE [NSNumber numberWithInt:1]
#define NOTIFICATION [NSNumber numberWithInt:2]

// local notifs
#define INVOCATION_ORIGINE_STRING @"INVOCATION_ORIGINE"
#define NOTIF_PROP_NAME @"BEACONS_APP_NOTIFS"

// Beacons
#define UUID_STRING @"uuid"
#define MAJOR_STRING @"major"
#define MINOR_STRING @"minor"

@end
