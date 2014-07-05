//
//  RosssViewController.h
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosssViewController : UIViewController
{
    UIButton* favStoreButton;
    UIImage *storeDetailsImg;
    UIImageView * connectionImgView;
    IBOutlet UIView *connectionsView;
    IBOutlet UIView *wishListview;
    IBOutlet UIView *favStoreview;
}
@property (weak, nonatomic) IBOutlet UIImageView *wishListFrameView;
@property (weak, nonatomic) IBOutlet UIImageView *storesFrameView;
@property (weak, nonatomic) IBOutlet UIImageView *connectionFrameView;
@property (weak, nonatomic) IBOutlet UIImageView *favFrameView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)menuButtonTouchUpInside:(id)sender;
- (IBAction)backButtonTouchUpInside:(id)sender;

@end
