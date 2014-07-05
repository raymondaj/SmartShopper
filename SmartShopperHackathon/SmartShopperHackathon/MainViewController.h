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
}

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)mainMenuButtonTouchUpInside:(id)sender;

    


@end
