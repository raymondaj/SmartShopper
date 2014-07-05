#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MyConstants.h"

@interface BaseViewController : UIViewController

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@property (strong, nonatomic) NSMutableDictionary *encountredBecons;

- (void) consumeSystemNotification:(UILocalNotification *)notification;
- (void) pushSystemNotification:(NSDictionary *) beacon;

@end
