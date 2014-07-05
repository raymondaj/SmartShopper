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
    backButton.hidden = YES;
    self.connectedAccountsImg.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(processNotificationCenterForBeacon:)
                                                 name:@"BEACONS_NOTIF_CENTER"
                                               object:nil];
    [self  showPersonalProfile];
    connectedPeopleButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 40, 305, 163)];
    peopleImg = [UIImage imageNamed:@"connected_people"];
    [connectedPeopleButton setImage:peopleImg forState:UIControlStateNormal];
    [connectedPeopleButton addTarget:self action:@selector(connectedPeopleButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    

    // Do any additional setup after loading the view.
}
-(void)showPersonalProfile
{
    [self.contentView removeFromSuperview];
    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 320, 1000) ];
    [self.contentView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"frank_profile_detail"]]];
    facebookButton = [[UIButton alloc]initWithFrame:CGRectMake(120, 443, 50, 18) ];
    [facebookButton setImage:[UIImage imageNamed:@"toggle_off"] forState:UIControlStateNormal] ;
    [facebookButton addTarget:self action:@selector(facebookButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:facebookButton];
    [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize = CGSizeMake(320, 350 + self.contentView.frame.size.height) ;
    self.connectedAccountsImg.hidden = YES;
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
    if (facebookButtonSelected == YES) {
        [selButton setImage:[UIImage imageNamed:@"toggle_off"] forState:UIControlStateNormal];
        facebookButtonSelected = NO;
    }
    else
    {
        [selButton setImage:[UIImage imageNamed:@"toggle_on"] forState:UIControlStateNormal];
        facebookButtonSelected = YES;
    }
    
}
-(IBAction)connectedPeopleButtonTouchUpInside:(id)sender
{
    [self performSegueWithIdentifier:@"toRossVC" sender:self];
}

- (IBAction)mainMenuButtonTouchUpInside:(id)sender {
    UIButton* selButton = (UIButton*)sender;
    backButton.hidden = NO;
    switch ([sender tag]) {
        case 1:
            self.connectedAccountsImg.hidden = NO;
            [self.contentView removeFromSuperview];
            self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 330, 320, connectedPeopleButton.frame.size.height +10)];

            [self.contentView addSubview:connectedPeopleButton];
            [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize = CGSizeMake(320, 350 + self.contentView.frame.size.height) ;
            
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

- (IBAction)backButtonTouchUpInside:(id)sender {
    [self showPersonalProfile];
    backButton.hidden = YES;
//    [self.navigationController popViewControllerAnimated:YES];
}
@end
