//
//  MainViewController.h
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "MyConstants.h"

@interface MainViewController : BaseViewController
{
    UIButton * facebookButton;
    BOOL facebookButtonSelected;
    IBOutlet UIButton *backButton;
    IBOutlet UIView *connectionsView;
    UIButton* connectedPeopleButton;
    UIImage *peopleImg;
}
@property (weak, nonatomic) IBOutlet UIImageView *offerImgView;
@property (weak, nonatomic) IBOutlet UIImageView *connectedAccountsImg;
- (IBAction)forwardButtonTouchUpInside:(id)sender;
- (IBAction)backButtonTouchUpInside:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)mainMenuButtonTouchUpInside:(id)sender;

    


@end
