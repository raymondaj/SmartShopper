//
//  OfferDetailViewController.h
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OfferDetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)addToCart:(id)sender;
- (IBAction)backButtonAction:(id)sender;

@end
