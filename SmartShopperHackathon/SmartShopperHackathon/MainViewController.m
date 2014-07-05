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
    self.connectedAccountsImg.hidden = YES;
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
    UIButton* offerButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    [offerButton addTarget:self action:@selector(offerButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [offerButton setImage:[UIImage imageNamed:@"offer_beacon"] forState:UIControlStateNormal];
    [self.view addSubview:offerButton];
    
}
-(IBAction)offerButtonTouchUpInside:(id)sender
{
    [self performSegueWithIdentifier:@"toOfferDetailsVC" sender:self];
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
    if ([selButton isHighlighted]) {
        [selButton setImage:[UIImage imageNamed:@"toggle_on"] forState:UIControlStateHighlighted];
        [selButton setImage:[UIImage imageNamed:@"toggle_off"] forState:UIControlStateNormal];
        [selButton setHighlighted:NO];
        
    }
    else
    {
        [selButton setImage:[UIImage imageNamed:@"toggle_on"] forState:UIControlStateNormal];
        [selButton setHighlighted:YES];
    }
    
}
-(IBAction)connectedPeopleButtonTouchUpInside:(id)sender
{
    [self performSegueWithIdentifier:@"toRossVC" sender:self];
}

- (IBAction)mainMenuButtonTouchUpInside:(id)sender {
    UIButton* selButton = (UIButton*)sender;
    UIButton* connectedPeopleButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 80, 305, 82)];
    UIImage *peopleImg = [UIImage imageNamed:@"connected_people"];
    switch ([sender tag]) {
        case 1:
            self.connectedAccountsImg.hidden = NO;
            [[self contentView] removeFromSuperview];
            self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 380, 320, 800)];
            [connectedPeopleButton setImage:peopleImg forState:UIControlStateNormal];
        [connectedPeopleButton addTarget:self action:@selector(connectedPeopleButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:connectedPeopleButton];
            [self.view addSubview:self.contentView];
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
- (IBAction)forwardButtonTouchUpInside:(id)sender {
    [self performSegueWithIdentifier:@"toRossVC" sender:self];
}
@end
