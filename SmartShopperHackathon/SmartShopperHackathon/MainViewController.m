//
//  MainViewController.m
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(processNotificationCenterForBeacon:)
                                                 name:@"BEACONS_NOTIF_CENTER"
                                               object:nil];

    [self.contentView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"frank_profile_detail"]]];
    facebookButton = [[UIButton alloc]initWithFrame:CGRectMake(120, 443, 50, 18) ];
    [facebookButton setImage:[UIImage imageNamed:@"toggle_off"] forState:UIControlStateNormal] ;
    [facebookButton addTarget:self action:@selector(facebookButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:facebookButton];
    self.scrollView.contentSize = CGSizeMake(320, 350 + self.contentView.frame.size.height) ;
    // Do any additional setup after loading the view.
}

- (void) processNotificationCenterForBeacon:(NSNotification *) notification{
    NSDictionary *notificationCenterMessage = notification.userInfo;
    NSString *msg = [NSString stringWithFormat:@"%@, %@, %@, %@", notificationCenterMessage [@"ALERT_BODY"],  notificationCenterMessage[UUID_STRING] , notificationCenterMessage[MAJOR_STRING] , notificationCenterMessage [MINOR_STRING]];
    
    NSLog(@"%@", msg);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
-(IBAction)facebookButtonTouchUpInside:(id)sender
{
    UIButton* selButton = (UIButton*)sender;
    if ([selButton state] == UIControlStateNormal) {
        [selButton setImage:[UIImage imageNamed:@"toggle_off"] forState:UIControlStateNormal];
        [selButton setHighlighted:YES];
        
    }
    else
    {
        [selButton setImage:[UIImage imageNamed:@"toggle_on"] forState:UIControlStateNormal];
        [selButton setHighlighted:NO];
    }
    
}
- (IBAction)mainMenuButtonTouchUpInside:(id)sender {
    UIButton* selButton = (UIButton*)sender;
    switch ([sender tag]) {
        case 1:
            if ([selButton state] == UIControlStateNormal) {
                [selButton setImage:[UIImage imageNamed:@"connected_accounts_active"] forState:UIControlStateNormal];
                [selButton setHighlighted:YES];
                
            }
            else
            {
                [selButton setImage:[UIImage imageNamed:@"connected_accounts"] forState:UIControlStateHighlighted];
                [selButton setHighlighted:NO];
            }
        case 2:
            if ([selButton isSelected])
                [selButton setSelected:NO];
            else
                [selButton setSelected:YES];
        case 3:
            if ([selButton isSelected])
                [selButton setSelected:NO];
            else
                [selButton setSelected:YES];
        case 4:
            if ([selButton isSelected])
                [selButton setSelected:NO];
            else
                [selButton setSelected:YES];

            break;
            
        default:
            break;
    }
}
@end
